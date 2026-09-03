import processing.sound.*;

Amplitude amp;
AudioIn in;
float A ;
float I ;

void setup() {
  size(900, 900);            // size of the canvas

  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  A =0;

  strokeWeight(3);
  noFill();
  background(255);
}

void draw() {

  // ampV is the amplitude between 0-1 ; 
  float ampV = (amp.analyze());    // analyzes the amplitude of the sound
  float AV = ampV *0.05;              // rationalizing the amp value

  I =5 ;          // number of levels for inception(recurrsion) shapes 


  // this part of the code is to give trails ... 
  fill(255, 50);        // change the seconed parameter(50) from 0-255 for trails
  noStroke();
  rect(0, 0, width, height);     
  noFill();



  stroke(0,50);
  A +=  ampV/10;           // spped of roatation
  
  
  float x = width/2;       //center of the design        
  float y = height/2;
  dance(I, x, y, AV);
}

void dance(float it, float u, float v, float av) {
  if (it <= 0) return;
  it -- ;
  pushMatrix();
  translate(u, v);
  rotate(it *A);
  float size = it*50;
  rect(-size/2, -size/2, size, size);            // change the shape here
  dance(it, size/2, -size/2, av);
  dance(it, size/2, size/2, av);
  dance(it, -size/2, -size/2, av);
  dance(it, -size/2, size/2, av);
  popMatrix();
}