class Bob{
  PVector pos, o ;
  float   r, a, aVel, aAcc , br , dam , m ;
  
  Bob(PVector o_, float r_, float br_){
    o = o_.get();
    pos = new PVector();
    r = r_;
    a = PI/2;
    aVel = 0.0;
    aAcc = 0.0 ;
    dam = 0.9995;
    br = br_ ;
    m =1 ;
  }
  
  void applyForce(){
      
}

  
  void show(){
    pos.set(r*sin(a),r*cos(a),0);
    pos.add(o);
    ellipse(pos.x,pos.y,br,br);  
  }
  
  void update(float force , float u_ ){
    
    
    float f =  force/m ;     // calculate the force
     
    float g = 0.4 ;       // gravity 
    
   
    
    aAcc = (-u_*g/r)*sin(a)*f;
    aVel += aAcc ;
   aVel *= dam ;
    a +=aVel ;
    
  }

}