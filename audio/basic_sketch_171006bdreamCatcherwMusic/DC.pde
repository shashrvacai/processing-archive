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
      if(d > 10){
        strokeWeight(1);
        ellipse(0,0,d,d);
        pushMatrix();
        rotateX(A/16);
        //rotateY(A/4);
        //rotateZ(A/2*(-a));
        strokeWeight(0.2);
        ellipse(0,0,d - d/4,d-d/4);
        popMatrix();
      }
      popMatrix();
      d-=10;
    }  
    
  }
    
  
}