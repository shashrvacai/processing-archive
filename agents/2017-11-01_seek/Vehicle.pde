class Vehicle{
   PVector pos , vel, acc ;
   float mS , mF ;  // max speed , max force ;
  
  Vehicle(float x_ , float y_, float m_){
    pos = new PVector(x_ , y_);  
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    mS = 10;
    mF = 0.2 ;
  }  
  
  void applyForce(PVector f_){
    acc.add(f_);
  }
  
  void seek(PVector t_){
    PVector D = PVector.sub(t_,pos);
    float d = D.mag();
    
 
    
    D.setMag(mS);    //--- If you want a follow thru   
       
    PVector S = PVector.sub(D,vel);
    S.limit(mF);
    applyForce(S);
  }
  
  void update(){
    vel.add(acc);
    vel.limit(mS);
    pos.add(vel);
    acc.set(0,0);
  }
  
  void show(){
    float theta = vel.heading() + PI/2 ;
    float b = map(pos.y , 0, height, 0,255);
    float c = map(theta , -4,4,0,255);
    //println(theta);
    fill(150,c,b);
    stroke(0,50);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    rect(0,0,4,40);
    popMatrix();
  }
  

}