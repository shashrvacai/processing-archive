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

  void run() {
    show();
    update();
    checkedges();
  } 

  void follow(FF ff) {
    PVector des = ff.lookup(pos);
    des.mult(ms);
    PVector steer = PVector.sub(des, vel);
    steer.limit(mf);
    applyf(steer);
  }
  
    PVector seek(PVector t_){
    PVector des = PVector.sub(t_,pos);
    des.normalize();
    des.mult(ms);
    PVector S = PVector.sub(des,vel);
    S.limit(mf);
    return S ;  
  }
  
   void aB(ArrayList<Vehicle> veh_, float xx_, float yy_){    
     PVector sF = seperate(veh_);
    PVector seekF = seek(new PVector(mouseX,mouseY)); 
    sF.mult(3);
    seekF.mult(1);  
    applyf(sF);
    applyf(seekF);  
  }
  
  PVector seperate(ArrayList<Vehicle> vs) {
    float dS = r*3 ;
    PVector sum = new PVector();
    int count = 0;
    for (Vehicle o : vs) {
      float d = PVector.dist(pos, o.pos);
      if ((d>0)&&(d <dS)) {
        PVector diff = PVector.sub(pos, o.pos);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count ++ ;
      }
    }

    if (count> 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(ms);
      sum.sub(vel);
      sum.limit(mf);
    }
    return sum ;
  }

  void applyf(PVector f) {
    acc.add(f);
  }

  void update() {
    vel.add(acc);
    vel.limit(ms);
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