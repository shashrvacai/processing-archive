class L {
  float x,y,h,w,co ;
  PVector Lpos ;
  
  L(float x_,float y_, float h_ , float w_, float co_){
    Lpos = new PVector(x_, y_);
     h = h_ ; w = w_ ; co = co_ ;
  }
  
  boolean contains(veh m, float Lx , float Ly){
    PVector l = m.pos;
    return l.x>Lx && l.x < Lx+ w && l.y > Ly && l.y <Ly+h;
  }
  
  PVector drag(veh m){
    float s = m.vel.mag();   // speed
    float dM = co *s*s ; // drag magnitude = co * speed square
    
    PVector dF = m.vel.get();
    dF.mult(-1);
    
    dF.normalize();
    dF.mult(dM);
    return dF ;
  }
  
  void show(float Lx,float Ly){
  noStroke();
  fill(50);
  rect(Lx,Ly,w,h);
  }
  
}
