class vehicle {
  
  ArrayList<PVector> history = new ArrayList<PVector>();

  PVector pos, vel, acc ;
  float r, ms, mf, a;

  vehicle(float x_, float y_) {
    pos = new   PVector(x_, y_ );
    vel = new PVector(0,-2 );
    acc = new PVector(0, 0);
    r =  6 ;
    ms = 4 ;
    a = 0;
    mf = 0.05 ;
  }

  void go() {
    show();
    update();
    checkEdges();
  }

  void applyF(PVector f_) {
    // PVector f = PVector.div(f_,r);
    acc.add(f_);
  }

  void arrive(PVector t_) {
    PVector des = PVector.sub(t_, pos);
    float d =des.mag();
    if(d < 100){
      float mm = map(d, 0 ,200, 0 , ms);
      des.setMag(mm);
    }else{des.setMag(ms);}
    
    PVector steer = PVector.sub(des, vel);
    steer.limit(mf);
    applyF(steer);
    
  }

  void update() {
    vel.add(acc);
    vel.limit(ms);
    pos.add(vel);
    acc.mult(0);
    
         history.add(pos.get());
    if (history.size() > 100) {
      history.remove(0);
    }
  }

  void show() {
     beginShape();
    stroke(0);
    strokeWeight(1);
    noFill();
    for(PVector v: history) {
      vertex(v.x,v.y);
    }
    endShape();
    
    float theta = vel.heading2D();
    stroke(255);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta+PI);
    line(0, 0, r, r*sin(a));
    line(0, 0, -r, r*sin(a));
    popMatrix();
    a += 0.2 ;
  }
  void checkEdges() {
    if (pos.x > width ) {
      pos.x = width ;
      vel.x *= -1 ;
    } else if (pos.x < 0) {
      pos.x = 0 ;
      vel.x *= -1 ;
    }
    if (pos.y > height ) {
      pos.y = height ;
      vel.y *= -1 ;
    } else if (pos.y < 0) {
      pos.y = 0 ;
      vel.y *= -1 ;
    }
  }
}