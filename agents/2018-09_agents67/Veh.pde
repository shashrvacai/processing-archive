class veh{
  PVector pos, acc, vel ;
  float r , mF, mS ;

  veh(float x_ , float y_){
    pos = new PVector(x_, y_);
    acc = new PVector(0,0);
    vel = new PVector(0,0);
    r =random(2,6) ;
    mS = 3 ;
    mF = 0.6 ;
  }
  
  void run(){
    
  }
  
   void af(PVector f_){
    acc.add(f_);
  }
  
  void seperate(ArrayList<veh> veh_){
    float dS = r*3 ;
    PVector sum = new PVector();
    int count = 0 ;
    for(veh o: veh_ ){
      float d = PVector.dist(pos,o.pos);
      if((d>0)&&(d<dS)){
        PVector diff = PVector.sub(pos,o.pos);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count ++ ;
      }
    }
    
    if(count > 0){
      sum.setMag(mS);
      PVector S = PVector.sub(sum,vel);
      S.limit(mF);
      af(S);
    }
    
  }
  
 
  
  void update(){
    
    vel.add(acc);
    vel.limit(mS);
    pos.add(vel);
    acc.mult(0);
  }
  
  void edges(){
    if(pos.x > width+r) pos.x = -r ;
    if(pos.y > height+r) pos.y = -r ;
    if(pos.x < -r) pos.x = height+r ;
    if(pos.y < -r) pos.y = width+r ;
  }
  
  void show(){
    stroke(0);
    rectMode(CENTER);
    float t = vel.heading2D();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(t);
    rect(0, 0,r,r*3);
    popMatrix();
  }
  
}