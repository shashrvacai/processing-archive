class Sust {
  float unit, theta, a;
  int num = 50, frames=180;
  
  Sust(){
      unit = width/num;
  }
  
  void run(float aa_){
  
    
    for (int y=0; y<=num; y++) {
    for (int x=0; x<=num; x++) {
      float distance = dist(width/2, height/2, x*unit, y*unit);
      float offSet = map(distance, 0, sqrt(sq(width/2)+sq(height/2)), 0, TWO_PI);
      float sz = map(sin(theta+offSet), -1, 1, unit*7, unit/3);
      float R = map(sin(theta+offSet), -1, 1,0,255);
      float d = map(sin(theta+offSet), -1, 1,0.1,5);
      float T = map(sin(theta+offSet), -1, 1,50,200);
      strokeWeight(d);
      stroke(10,R,250);
      float angle = atan2(y*unit-height/2, x*unit-width/2);
      pushMatrix();
      translate(x*unit, y*unit);
      rotate(theta/angle*0.02);   // angle
      rotate(theta*0.02/angle);  // thata 
      float px = map(sin(theta+offSet),-1,1,0,100);
      ellipse(px,0, sz, sz);
      popMatrix();
    }
  }
  stroke(255);

  theta += aa_;
  
  }
}