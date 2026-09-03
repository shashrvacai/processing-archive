class Vehicle {
  PVector pos, vel, acc ;
  float r, mf, ms ,a;


  Vehicle(PVector pos_, float ms_, float mf_ ) {
    pos = pos_.get();
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    
    
    a = 0 ;
    r = 5 ;
    ms = ms_ ;
    mf = mf_ ;
  }

  void run(float mS_) {
    show();
    update(mS_);
    checkedges();
  } 

  void follow(FF ff) {
    PVector des = ff.lookup(pos);
    des.mult(ms);
    PVector steer = PVector.sub(des, vel);
    steer.limit(mf);
    applyf(steer);
  }

  void applyf(PVector f) {
    acc.add(f);
  }

  void update(float mS_) {
    vel.add(acc);
    vel.limit(mS_);
    pos.add(vel);
    acc.mult(0);
  }

  void show() {
    float theta = vel.heading2D() + radians(90);
    fill(175);
    stroke(0);
     pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta+PI);
    line(0, 0, r, r*sin(a));
    line(0, 0, -r, r*sin(a));
    popMatrix();
    a+= 0.2 ;

  }

  void checkedges() {
    if (pos.x < -r) pos.x = width+r ;
    if (pos.y < -r) pos.y = height+r ;
    if (pos.x > width+r) pos.x = -r ;
    if (pos.y > height+r) pos.y = -r ;
  }
}
