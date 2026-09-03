import processing.sound.*;

int num=42, frames = 90;
float theta;

Amplitude  amp ;
AudioIn in ;

void setup() {
  size(700, 1000);
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in. start();
  amp.input(in);  
}

void draw() {
  float aa =  amp.analyze()*5;
  
  background(20);
  stroke(240);
  noFill();

  for (int i=0; i<num; i++) {
    float sz = i*35;
    float sw = map(sin(theta+TWO_PI/num*i), -1, 1, 0.1, 16);
    strokeWeight(sw);
    rectMode(CENTER);
    rect(width/2, (height/3)*2, sz, sz*2);
  }
  theta -= aa;  
}
