class eS_TWO {
  int num=44, frames = 90;
  float theta;

  eS_TWO() {
  }

  void run(float a_) {
    for (int i=0; i<num; i++) {
      float sz = i*75;
      float sw = map(sin(theta+TWO_PI/num*i), -1, 1, 0.1, 28);
      stroke(255);
      strokeWeight(sw);
      ellipse(width/2, height/2, sz, sz);
    }
    theta += map(a_, 0, 1, 0,5);
  }
}