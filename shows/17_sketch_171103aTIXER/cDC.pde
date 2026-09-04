class Dc {
  color top = color(100, 304, 200);        // color 1
  color bottom =  color(200, 177, 5);      // color 2
  Dc(){

  }
  
  void DCdraw(float x,float y, int d ,float a, float am_){
   
    
    if (d > 20) { 
    pushMatrix();
    translate(x,y);
      rotate(90);
      rotateX(am_+a);
      rotateY(am_/2);
      rotateZ(am_/3*(-a));
      if(d > 10){
         float C = map(y, 0, height, 0, 1);
        color c = lerpColor(top, bottom, C);
        stroke(c);
        strokeWeight(1);
        ellipse(0,0,d,d);
        pushMatrix();
        rotateX(am_/16);
        
        strokeWeight(0.2);
        ellipse(0,0,d - d/4,d-d/4);
        popMatrix();
      }
      popMatrix();
      d-=10;
    }  
    
  }
    
  
}