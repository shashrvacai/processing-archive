class Dc {
  
  Dc(){

  }
  
  void DCdraw(float x,float y, int d ,float a){
    if (d > 20) { 
    pushMatrix();
    translate(x,y);
      rotate(90);
      rotateX(A+a);
      rotateY(A/2);
      rotateZ(A/3*(-a));
      ellipse(0,0,d,d);
      popMatrix();
      d-=10;
    }  
    
  }
    
  
}