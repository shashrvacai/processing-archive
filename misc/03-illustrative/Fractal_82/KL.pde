class KL {
  PVector start , end ;
  
  KL(PVector a_ , PVector b_){
    start = a_.get();
    end = b_.get();
  }
  
  void show(){
    stroke(0);
    strokeWeight(0.5);
    line(start.x, start.y, end.x, end.y);
  }
  
  PVector KA(){
    return start.get();
  }
  
  PVector KB(){
    PVector v = PVector.sub(end, start);
     v.div(3);
     v.add(start);
     return v ;
  }
  
  PVector KC(){
    PVector p=  start.get();
    PVector q = PVector.sub(end, start);
    q.div(3);
    p.add(q);
    rotate(q,(-radians(60)));
    p.add(q);
    
    return p ;    
  } 
  
  PVector KD(){
    PVector  p= PVector.sub(end, start);
    p.mult(2/3.0);
    p.add(start);
    return p ;
  }
  
  PVector KE(){
    PVector q = end.get();
    return q ;
  }
  
}

public void rotate(PVector v_, float t_){
  float xT = v_.x ;
  v_.x = v_.x*PApplet.cos(t_)- v_.y*PApplet.sin(t_);
  v_.y = xT*PApplet.sin(t_)- v_.y*PApplet.cos(t_);
}