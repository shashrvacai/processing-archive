class WaveTwo {
  
  float unit, theta;
int num = 27, frames=120;
  WaveTwo() {
    unit = width/num;
    rectMode(CENTER);
  }

  void run(float aa_) {
    float AA = aa_*0.5;
    noStroke();
    fill(255);
    for (int y=0; y<=num; y++) {
      for (int x=0; x<=num; x++) {
        float distance = dist(width/2, height/2, x*unit, y*unit);
        float offSet = map(distance, 0, sqrt(sq(width/2)+sq(height/2)), 0, TWO_PI);
        float sz = map(sin(theta+offSet), -1, 1, unit*.9, unit*.1)*(AA*50);
        float angle = atan2(y*unit-height/2, x*unit-width/2)*aa_;
        float r = map(distance, 0, sqrt(sq(width/2)+sq(height/2)), 0, PI);
        float w = map(distance, 0, sqrt(sq(width/2)+sq(height/2)), 5, 2)*AA;
        pushMatrix();
        translate(x*unit, y*unit);
        rotate(r);
        rotate(angle);
        fill(255);
        rect(0, 0, sz, sz*w*aa_);
        popMatrix();
      }
    }
    stroke(255);

    theta -= TWO_PI/frames+AA;
    //if (frameCount<=frames) saveFrame("image-###.gif");
  }
}