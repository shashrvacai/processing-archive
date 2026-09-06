class Line{
  PVector a,b ;
  
  Line(PVector s_, PVector e_){
    a= s_.get();
    b = e_.get();    
  }
  
  void show(){
   stroke(0);
   line(a.x,a.y,b.x,b.y);
  }
  PVector s(){
    return a.get();
  }
  
  PVector e(){
    return b.get();
  }
  
  PVector KL(){
    PVector v = PVector.sub(b,a);
    v.div(3);
    v.add(a);
    return v ;
  }
  
  PVector KM(){
    PVector v = PVector.sub(b,a);
    v.div(3);
    PVector p= a.get();
    p.add(v);
    
    rotate(v,-radians(60));
    p.add(v);
    
    return p;
  }
  PVector KR(){
    PVector v = PVector.sub(a,b);
    v.div(3);
    v.add(b);
    return v;
  }
}

public void rotate(PVector v , float t_){
  float xTemp = v.x;
  v.x = v.x*cos(t_)- v.y*sin(t_);
  v.y = xTemp*sin(t_)+ v.y*cos(t_);
}