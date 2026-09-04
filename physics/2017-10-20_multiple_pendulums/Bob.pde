class Bob {
  PVector pos, o ;
  float a, r , aVel, aAcc , dam , br;
  
  Bob(PVector o_,float r_, float br_){
    o = o_.get();
    pos = new PVector();
    r = r_ ;
    a = 4 ;
    aVel = 0.0 ;
    aAcc = 0.0 ;
    dam = 0.99;
    br = br_ ;
  }
  
  void update(){
    
    float g = 0.4;
    aAcc =  (-1 *g/r)*sin(a);
    aVel += aAcc ;
    //aVel *= dam ;
    a+= aVel ;
  }
  
  void show(){
    pos.set(r*sin(a),r*cos(a),0);
    pos.add(o);
    //fill(175,250);
    noStroke();
    ellipse(pos.x,pos.y,br,br);
  }
  
  
}
