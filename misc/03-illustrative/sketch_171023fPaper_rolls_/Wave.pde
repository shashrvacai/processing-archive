class Wave{
  float startAngle = 0;
  float angleVel = 0.5;
  float r = 20 ;
  float u ;
  
  Wave( ){
  }
  
  void drawWave(float p_ , float q_ ,float u_ ){
    
    startAngle += 0.001;
    float angle = startAngle;

   for (int x = 0; x <= width; x += r) {
    float y = map(sin(angle*u_/2),-1,1,p_,q_);
    noStroke();
    fill(255);
    strokeWeight(2);
    ellipse(x,y,r,r);
    angle += angleVel;
  
  } 
  
  }
  
  

}
