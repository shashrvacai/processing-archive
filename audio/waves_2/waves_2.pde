import processing.sound.*;

Amplitude  amp ;
AudioIn in ;

float unit, theta;
int num = 27, frames=120;

void setup() {
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in. start();
  amp.input(in);
  
  size(500, 500);
  unit = width/num;
  rectMode(CENTER);
  
}

void draw() {
  float aa = amp.analyze();
  fill(0,25);
  rect(width/2,height/2,width,height);
  noFill();
  
  
  noStroke();
  fill(255);
  for (int y=0; y<=num; y++) {
    for (int x=0; x<=num; x++) {
      float distance = dist(width/2, height/2, x*unit, y*unit);
      float offSet = map(distance, 0, sqrt(sq(width/2)+sq(height/2)), 0, TWO_PI);
      float sz = map(sin(theta+offSet), -1, 1, unit*.9, unit*.1)*(aa*50);
      float angle = atan2(y*unit-height/2, x*unit-width/2);
      float r = map(distance, 0, sqrt(sq(width/2)+sq(height/2)), 0, PI)*aa;
      float w = map(distance, 0, sqrt(sq(width/2)+sq(height/2)), 5, 2)*aa;
      pushMatrix();
      translate(x*unit, y*unit);
      rotate(r);
      rotate(angle);
      fill(255);
      rect(0, 0, sz, sz*w);
      popMatrix();
    }
  }
  stroke(255);

  theta -= TWO_PI/frames+aa;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}