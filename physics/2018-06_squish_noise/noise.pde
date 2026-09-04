import processing.sound.*;
//import spout.*;

//Spout spout;
Amplitude  amp ;
AudioIn in ;


void setup() {
  //spout = new Spout(this);
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in. start();
  amp.input(in);
  
  size(500, 500);
  fill(0);
  noStroke();
  rectMode(CENTER);
  frameRate(30);
  noiseDetail(2, 0.9);
  colorMode(HSB);
}

void draw() {
  float aa =  amp.analyze();
  background(0,0,0);
  for (int x = 10; x < width; x += 10) {
    for (int y = 10; y < height; y += 10) {
      float n = noise(x * 0.005, y * 0.005, frameCount *aa/2);
      pushMatrix();
      translate(x, y);
      rotate(TWO_PI * n);
      scale(10 * n);
      fill(map(n,0,1,90,200),255,255,200);
      rect(0, 0, 1, 1);
      popMatrix();
    }
  }
  
}
