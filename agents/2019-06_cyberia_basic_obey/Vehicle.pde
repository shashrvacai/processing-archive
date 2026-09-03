class  Vehicle {
  PVector pos, vel, acc ;
  float r, mS, mf ;


  Vehicle(float x, float y ,float sz_) {
    pos =  new PVector(x, y);
    r = sz_ ;
    mS = 3 ;
    mf =   0.5 ;
    acc =  new PVector(0, 0);
    vel = new PVector(0, 0);
  }


  void update() {
    vel.add(acc);
    vel.limit(mS);
    pos.add(vel);
    acc.mult(0);
  }

  void applyF(PVector f_) {
    acc.add(f_);
  }
  
  void seperate(ArrayList<Vehicle> vehicles, float sep_, float mf_) {
    float desSep = sep_ ;
    PVector sum = new PVector();
    int count =  0 ;

    for (Vehicle other : vehicles) {
      float d = PVector.dist(pos, other.pos);

      if ((d > 0 )&& (d < desSep)) {
        PVector diff = PVector.sub(pos, other.pos);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count ++ ;
      }
    }

    if (count > 0 ) {
      sum.setMag(mS);
      PVector steer = PVector.sub(sum, vel);
      steer.limit(mf_);
      applyF(steer);
    }
  }

  void display(float sz_) {
    fill(0,255,0);
    strokeWeight(3);
    stroke(255,0,0);
    pushMatrix();
    translate(pos.x, pos.y);
    ellipse(0, 0, r, r);
    popMatrix();
  }
  void borders() {
    if (pos.x < 200) { 
      vel.x *= -1 ;
      pos.x = 200;
    } else if (pos.x > width-200) { 
      vel.x *= -1;
      pos.x = width-200 ;
    }


    if (pos.y < 200) {
      vel.y *= -1 ;
      pos.y = 200 ;
    }
    if (pos.y > height-200) {
      pos.y = height-200 ;
      vel.y *= -1;
    }
  }
}
