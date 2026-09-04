class orb {
  PVector pos, vel, acc ;
  float r, mS, mF ;

  orb(float x_, float y_) {
    pos = new PVector(x_, y_);
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    r = 20 ;
    mS = 5 ;
    mF = 0.2 ;
  }

  void applyF(PVector F) {
    acc.add(F);
  }

  void seperate(ArrayList<orb> o, float aa_) {
    float sep = r*aa_ ;
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
    
    if(count > 0 ){
      sum.setMag(mS);
      PVector steer = PVector.sub(sum,vel);
      steer.limit(mF);
      applyF(steer);
    }
  }

  void update(float aa_) {
    vel.add(acc);
    vel.limit(mS);
    pos.add(vel);
    acc.mult(0);
  }

  void show() {
    color c = grab.get(int(pos.x), int(pos.y));
    fill(c,150);
    noStroke();
    //fill(255);
    pushMatrix();
    translate(pos.x, pos.y);
    ellipse(0, 0, r/2, r/2);
    popMatrix();
  }
  
   void borders() {
    if (pos.x < -r) pos.x = width+r;
    if (pos.y < -r) pos.y = height+r;
    if (pos.x > width+r) pos.x = -r;
    if (pos.y > height+r) pos.y = -r;
  }
}
