class Tenticle {
  float[] x, y, angle ; 
  float targetX, targetY, segLength, numSegments;

  Tenticle(int nSeg_, float sLen_ , float posX_, float posY_) {
    numSegments= nSeg_;
    segLength = sLen_ ;
    x = new float[nSeg_];
    y = new float[nSeg_];
    angle = new float[nSeg_];
    x[x.length-1] = posX_;     // Set base x-coordinate
    y[x.length-1] = posY_;     // Set base y-coordinate
  }
  
  
  void update(){
    reachSegment(0, mouseX, mouseY);
  
  for (int i=1; i<numSegments; i++) {
    reachSegment(i, targetX, targetY);
  }
  for (int i=x.length-1; i>=1; i--) {
    positionSegment(i, i-1);
  } 
  for (int i=0; i<x.length; i++) {
    segment(x[i], y[i], angle[i], (i+1)/10);
  }
  
  }
  
  
  void positionSegment(int a, int b) {
  x[b] = x[a] + cos(angle[a]) * segLength;
  y[b] = y[a] + sin(angle[a]) * segLength;
}

void reachSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  angle[i] = atan2(dy, dx);  
  targetX = xin - cos(angle[i]) * segLength;
  targetY = yin - sin(angle[i]) * segLength;
}

void segment(float x, float y, float a, float sw) {
  stroke(255);
  strokeWeight(sw);
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}
}
