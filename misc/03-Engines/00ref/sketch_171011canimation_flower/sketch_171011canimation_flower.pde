import processing.sound.*;
PImage F ;


Amplitude amp ;
AudioIn in ;

Particle p ;

void setup(){
  size(600,600);
  p = new Particle();
  F = loadImage("f.png");
  
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
  
}

void draw(){
  background(0);
  PVector wind = new PVector(1,0.5);
  
  if(mousePressed){
    p.applyForce(wind);
  }
  p.show();
  p.update();
  p.edges();
}