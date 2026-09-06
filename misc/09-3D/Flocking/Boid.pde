class Boid {

  Vec3D loc;
  Vec3D vel;
  Vec3D acc;
  float maxforce;
  float maxspeed;

  float neighborDist;
  float desiredSeparation;

  Boid(Vec3D l, float ms, float mf, float nd, float sep) {
    loc=l;
    acc = new Vec3D();
    vel = Vec3D.randomVector();
    maxspeed = ms;
    maxforce = mf;
    neighborDist=nd*nd;
    desiredSeparation=sep;
  }

  void run(ArrayList boids) {
    flock(boids);
    update();
    borders();
    render();
  }

   void flock(ArrayList boids) {
    Vec3D sep = separate(boids);   // Separation
    Vec3D ali = align(boids);      // Alignment
    Vec3D coh = cohesion(boids);   // Cohesion

    sep.scaleSelf(5.5);
    ali.scaleSelf(1.0);
    coh.scaleSelf(1.0);

    acc.addSelf(sep);
    acc.addSelf(ali);
    acc.addSelf(coh);
  }

  void update() {
    vel.addSelf(acc);
    vel.limit(maxspeed);
    loc.addSelf(vel);
    acc.clear();
  }

  void seek(Vec3D target) {
    acc.addSelf(steer(target,false));
  }

  void arrive(Vec3D target) {
    acc.addSelf(steer(target,true));
  }


  Vec3D steer(Vec3D target, boolean slowdown) {
    Vec3D steer;  // The steering vector
    Vec3D desired = target.sub(loc);  // A vector pointing from the location to the target
    float d = desired.magnitude(); // Distance from the target is the magnitude of the vector
    if (d > 0) {
      // Normalize desired
      desired.normalize();
      // Two options for desired vector magnitude (1 -- based on distance, 2 -- maxspeed)
      if ((slowdown) && (d < 100.0f)) desired.scaleSelf(maxspeed*(d/100.0f)); // This damping is somewhat arbitrary
      else desired.scaleSelf(maxspeed);
      // Steering = Desired minus Velocity
      steer = desired.sub(vel).limit(maxforce);  // Limit to maximum steering force
    } 
    else {
      steer = new Vec3D();
    }
    return steer;
  }

  void render() {   
    noStroke();
    Vec3D col=colorMatrix.applyTo(loc);
    fill(col.x,col.y,255);
    //gfx.cone(new Cone(loc,vel,0,BOID_SIZE,BOID_SIZE*4),5,false);
    
    Vec3D sO = new Vec3D(loc.x,loc.y,loc.z);
    gfx.sphere(new Sphere(sO,5),5);

  }

  // Wraparound
  void borders() {
    if (loc.x < -DIM) loc.x = DIM;
    if (loc.y < -DIM) loc.y = DIM;
    if (loc.z < -DIM) loc.z = DIM;
    if (loc.x > DIM) loc.x = -DIM;
    if (loc.y > DIM) loc.y = -DIM;
    if (loc.z > DIM) loc.z = -DIM;
  }

  // Separation
  Vec3D separate (ArrayList boids) {
    Vec3D steer = new Vec3D();
    int count = 0;
    // For every boid in the system, check if it's too close
    for (int i = boids.size()-1 ; i >= 0 ; i--) {
      Boid other = (Boid) boids.get(i);
      if (this != other) {
        float d = loc.distanceTo(other.loc);
        if (d < desiredSeparation) {
          Vec3D diff = loc.sub(other.loc);
          diff.normalizeTo(1.0/d);
          steer.addSelf(diff);
          count++;
        }
      }
    }
    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }

    if (steer.magSquared() > 0) {
      steer.normalizeTo(maxspeed);
      steer.subSelf(vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  Vec3D align (ArrayList boids) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = boids.size()-1 ; i >= 0 ; i--) {
      Boid other = (Boid) boids.get(i);
      if (this != other) {
        if (loc.distanceToSquared(other.loc) < neighborDist) {
          steer.addSelf(other.vel);
          count++;
        }
      }
    }
    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }

    if (steer.magSquared() > 0) {
      steer.normalizeTo(maxspeed);
      steer.subSelf(vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  Vec3D cohesion (ArrayList boids) {
    Vec3D sum = new Vec3D(); 
    int count = 0;
    for (int i = boids.size()-1 ; i >= 0 ; i--) {
      Boid other = (Boid) boids.get(i);
      if (this != other) {
        if (loc.distanceToSquared(other.loc) < neighborDist) {
          sum.addSelf(other.loc); // Add location
          count++;
        }
      }
    }
    if (count > 0) {
      sum.scaleSelf(1.0/count);
      return steer(sum,false); 
    }
    return sum;
  }
}
