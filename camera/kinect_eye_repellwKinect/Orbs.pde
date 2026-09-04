

class orb {
  PVector pos, vel, acc ;
  float r, mS, mF, ang ;

  orb(float x_, float y_) {
    pos = new PVector(x_, y_);
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    r = random(300, 340) ;
    mS =1 ;
    mF = 2 ;
    ang =0.0 ;
  }

  void applyF(PVector F) {
    acc.add(F);
  }

  void updateEye(int mx, int my) {
    ang = atan2(my-pos.y, mx-pos.x);
  }

  void seperate(ArrayList<orb> o) {
    float sep = 3*r/2 ;
    PVector sum = new PVector();
    int count = 0 ;
    for (orb other : o ) {
      float d = PVector.dist(other.pos, pos);
      if ((d>0)&&(d< sep)) {
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
      steer.limit(mF);
      applyF(steer);
    }
  }

  void update() {
    vel.add(acc);
    vel.limit(mS);
    pos.add(vel);
    acc.mult(0);
  }

  void show() {
    stroke(0);
    fill(255);
    pushMatrix();
    translate(pos.x, pos.y);
    ellipse(0, 0, 3 *r/2, r);
    rotate(ang);
    fill( 0);
    ellipse(r/4, 0, r/2, r/2);
    pushMatrix();
    popMatrix();
    fill(255);
    ellipse(r/8,0,r/10,r/10);
    popMatrix();
  }

  void borders() {
    if (pos.x < 0) { 
      vel.x *= -1 ;
      pos.x = 0;
    } else if (pos.x > width) { 
      vel.x *= -1;
      pos.x = width ;
    }


    if (pos.y < 0) {
      vel.y *= -1 ;
      pos.y = 0 ;
    }
    if (pos.y > height) {
      pos.y = height ;
      vel.y *= -1;
    }
  }
}
