class Veh {
  PVector pos, acc, vel;
  float r, mS, mF ;

  Veh(PVector l_, float mS_, float mF_) {
    pos = l_.get();
    r = 3 ;
    mS = mS_ ;
    mF = mF_ ;
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
  }

  public void run(float aa_) {
    update(aa_);
    show();
    edges();
  }

  void aF(PVector for_) {
    acc.add(for_);
  }

  void update(float aa_) {
    vel.add(acc);
    vel.limit(aa_);
    pos.add(vel);
    acc.mult(0);
  }

  void show() {
    float t = vel.heading2D()+ radians(90);
    fill(255);
    noStroke();
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(t);
    ellipse(0, 0, 7, 7);
    popMatrix();
  }

  void edges() {
    if (pos.x < -r) pos.x = width+r;
    if (pos.y < -r) pos.y = height+r;
    if (pos.x > width+r) pos.x = -r;
    if (pos.y > height+r) pos.y = -r;
  }

  void follow(FF f_) {
    PVector des = f_.lookup(pos);
    des.mult(mS);  
    PVector s = PVector.sub(des, vel);
    s.limit(mF);
    aF(s);
  }
}