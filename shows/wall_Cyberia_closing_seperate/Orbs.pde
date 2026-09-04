class orb {
  PVector pos, vel, acc ;
  float r, mS, mF ;
  int R = 255, G = 255, B = 255 ;

  orb(float x_, float y_) {
    pos = new PVector(x_, y_);
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    r = 12 ;
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
    if(R <=0){ R=255;}else{R -= 1;}
    if(G <=0){ G=255;}else{G-= 2; }
    if(B <=0){ B=255;}else{B-= 3; }
  }

  void show() {
    noStroke();
    fill(int(R),(int)G,(int)B);
    pushMatrix();
    translate(pos.x, pos.y);
    ellipse(0, 0, r, r);
    popMatrix();
  }
  
   void borders() {
    if (pos.x < -r) pos.x = width+r;
    if (pos.y < -r) pos.y = height+r;
    if (pos.x > width+r) pos.x = -r;
    if (pos.y > height+r) pos.y = -r;
  }
}
