class Vehicle{
   PVector pos , vel, acc ;
   float mS , mF ,a , r ;  // max speed , max force ;
  
  Vehicle(float x_ , float y_, float m_){
    pos = new PVector(x_ , y_);  
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    mS = 10;
    mF = 0.2 ;
    r = 100 ;
    a =0 ;
  }  
  
  void applyForce(PVector f_){
    acc.add(f_);
  }
  
  void arrive(PVector t_){
    PVector D = PVector.sub(t_,pos);
    float d = D.mag();
    
 
    
       if(d < 100){
        float ma = map(d,0,100,0, mS);
        D.setMag(ma);
      }else {
        D.setMag(mS);
      }
       
    PVector S = PVector.sub(D,vel);
    S.limit(mF);
    applyForce(S);
  }
  
  void update(){
    vel.add(acc);
    vel.limit(mS);
    pos.add(vel);
    acc.set(0,0);
    a+=0.03 ;
  }
  
  void show(){
    float theta = vel.heading() + PI/2 ;
    float b = map(pos.y , 0, height, 0,255);
    float c = map(theta , -4,4,0,255);
    //println(theta);
    float  p=  r *sin(a);
    float q = r*cos(a);
    
    fill(150,c,b);
    stroke(0,50);
    pushMatrix();
    translate(pos.x+p, pos.y+q);
    rotate(-theta);
    rect(0,0,6,60);
    popMatrix();
  }
  

}