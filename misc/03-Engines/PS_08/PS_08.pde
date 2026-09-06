import processing.sound.*;

PS Ps1, Ps2 , Ps3 ;
Amplitude amp ;
AudioIn in ;



void setup() {
  size(1000, 360);
  
  PImage img = loadImage("texture.png");
  Ps1 = new PS(0, new PVector(-150, 0), img);
  Ps2 = new PS(0, new PVector(0, 0), img);
  Ps3 = new PS(0, new PVector(150, 0), img);


 
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);  
  in.start();
  amp.input(in);
}

void draw() {
  float a = amp.analyze();
  translate(width/2, height/2);
  

  background(0);
  float dx = map(a, 0, 0.005, -0.1, 0.1);   // map value
  PVector w = new PVector(0, -dx);
  PVector w_ = new PVector(0, dx);
  Ps1.aF(w);
  Ps1.run();
  Ps2.aF(w_);
  Ps2.run();
  Ps3.aF(w);
  Ps3.run();
  for (int i = 0; i < 2; i++) {
    Ps1.aP();
    Ps2.aP();
    Ps3.aP();
  }
  
}