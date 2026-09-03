class Vehicle{
  PVector pos, vel, acc ;
  float r, ms, mf ;
  
  Vehicle(float x_ , float y_){
    acc = new PVector(0,0);  
    vel = new PVector(0,-2); 
    pos = new PVector(x_,y_);
    r = 6 ;
    ms = 4 ;
    mf = 0.1 ;
  }
  
  void update(){
    vel.add(acc);
    vel.limit(ms);
    pos.add(vel);
    acc.mult(0);  
  }
  
  void applyF(PVector f_){
    acc.add(f_);
  }
  
  void seek(PVector t_){
    PVector des = PVector.sub(t_,pos);
    des.setMag(ms);
    PVector steer = PVector.sub(des,vel);
    steer.limit(mf);
    applyF(steer);
  }
  
  void show() {
    // Draw a triangle rotated in the direction of velocity
    float theta = vel.heading2D() + PI/2;
    fill(127);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
    
    
  }
}