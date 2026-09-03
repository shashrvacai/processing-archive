import processing.sound.*;

float unit, theta,a;
int num = 50, frames=180;
Amplitude amp;
AudioIn in ;

void setup() {
  size(1000, 1000);
  unit = width/num;
  amp = new Amplitude(this);
  in = new AudioIn(this,0);
  in.start();
  amp.input(in);
  
}

void draw() {
  
  float aa = amp.analyze()*5;
  fill(0,30);
  noStroke();
  rect(0,0,width, height);
  fill(255);
  
  
  for (int y=0; y<=num; y++) {
    for (int x=0; x<=num; x++) {
      float distance = dist(width/2, height/2, x*unit, y*unit);
      float offSet = map(distance, 0, sqrt(sq(width/2)+sq(height/2)), 0, TWO_PI);
      float sz = map(sin(theta+offSet), -1, 1, unit*.2, unit*.1);
      float angle = atan2(y*unit-height/2, x*unit-width/2);
      pushMatrix();
      translate(x*unit, y*unit);
      rotate(theta/angle*0.02);   // angle
      rotate(theta*0.02/angle);  // thata 
      float px = map(sin(theta+offSet),-1,1,0,50);
      ellipse(px,0, sz, sz);
      popMatrix();
    }
  }
  stroke(255);

  theta += aa;
}