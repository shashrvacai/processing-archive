class Branch{
  PVector s , e ,vel ;
  float timer  , timeStart , xoff ;
  
  boolean grow = true ;
  
  Branch(PVector s_ , PVector v_, float n_){
      s = s_.get() ;
      e = s_.get();
      vel = v_.get();
      xoff = 0 ;
      timeStart = n_ ;
      timer = timeStart ;
  }
  void update(){
    if(grow){
      
      float n = noise(xoff)*100 ;
      //vel.add(0, n);
      e.add(vel);
    }
    
    xoff += 0.01; 
  }
  
  void render(){
    stroke(0);
    line(s.x,s.y,e.x,e.y);
  }
  
  boolean timeToBranch(){
    timer --;
    if(timer < 0 &&  grow){
      grow = false; 
      return true ;
    }else {
      return false ;
    }
  }
  
  Branch branch(float a_){
    float t = vel.heading2D();
    float mag = vel.mag();
    t += radians(a_);
    PVector nVel = new PVector(mag*cos(t),mag*sin(t));
    return new Branch(e , nVel ,timeStart*0.68f );
  }
  

}