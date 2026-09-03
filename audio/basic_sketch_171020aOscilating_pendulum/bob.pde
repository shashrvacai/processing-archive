class bob{
  PVector pos, O ;
  float r ;  // dist from the center 
  float a ;  // angle 
  float aVel, aAcc ;
  float Br ; // raduis of Bob ;
  float dam ; //damping;

  bob(PVector O_ , float r_){
    
    O = O_.get();
    pos = new PVector();
    r = r_;
    a = PI/4;

    aVel = 0.0;
    aAcc = 0.0;
    dam = 0.995;   // Arbitrary damping
    Br = 8.0;
  }
  
  void go(){
 //   update();
    show();
  }
  
  void update(float Am_){
     aAcc = (-Am_/(r/2))*sin(a);
     aVel+=aAcc ;
     aVel = constrain(aVel,-1,1);
    // println(aVel);
     aVel *= dam;
     a += aVel;
     
  }
  
  
  void show(){
    pos.set(r*sin(a),r*cos(a),0);
    pos.add(O);
    
    
    noStroke();
    fill(250,150);
    ellipse(pos.x,pos.y,Br,Br);
  } 

}