void polygon(float x_, float y_, float r_, int n_, float x1_, float y1_, float r1_, int n1_) {
  float angle = TWO_PI / n_;
    float angle1 = TWO_PI / n1_;
  beginShape();  
 
  endShape(CLOSE);
  
  //beginShape();  
  for (float a_ = 0; a_ < TWO_PI; a_ += angle) {
    float sx = x_ + cos(a_+b) * r_;
    float sy = y_ + sin(a_+a) * r_;
    
     for (float b_ = 0; b_ < TWO_PI; b_ += angle1) {
    float sx1 = x1_ + cos(b_+a) * r1_;
    float sy1 = y1_ + sin(b_+b) * r1_;
    line(sx,sy,sx1, sy1);
  }
  }
  
  //endShape(CLOSE);
}