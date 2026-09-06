import processing.sound.*;
import processing.video.*;


Amplitude amp;
AudioIn in;
PImage f;
Capture v ;


void setup() {
  size(925, 925);
  f = loadImage("f.png");
  v = new Capture(this, 1280,1024, 30);
  v.start();
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}



void draw() {
  if(v.available()){
  v.read();
  }
   
  float Sc = amp.analyze()*10;
  
  
  tint(0, 153*Sc, 255-15*Sc);
  image(v, 0, 0, 640, 512);
  
  
  //if (Sc >0.5){
  //  v.read();
  //}
  
  
}