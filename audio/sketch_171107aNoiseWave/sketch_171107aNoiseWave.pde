import processing.sound.*;

Amplitude amp;
AudioIn in ;


void setup() {
  
  amp = new Amplitude(this);
  in = new AudioIn(this,0);
  in.start();
  amp.input(in);
  
  
  size(1000, 1000);
  fill(0);
  noStroke();
  rectMode(CENTER);
  frameRate(30);
  noiseDetail(2,0.5);
}

void draw() {
  
  float aa = amp.analyze()*0.009;
  background(255);
  for (int x = 10; x < width; x += 10) {
    for (int y = 10; y < height; y += 10) {
      float n = noise(x * 0.002, y * 0.002, frameCount * aa);
      pushMatrix();
      translate(x, y);
      rotate(TWO_PI *aa*n);
      scale(20 * n);
      rect(0, 0, 1, 1);
      popMatrix();
    }
  }
  
}