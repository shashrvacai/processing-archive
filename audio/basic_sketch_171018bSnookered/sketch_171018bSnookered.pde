//import spout.*;

import processing.sound.*;
//import spout.*;


Amplitude amp ;
AudioIn in ;
//Spout spout;

float aVel = 0.0 ;    //  initial velocity
float aAcc = 0.001 ;
float r = 300;       // raduis from the center  
float a = 0.0 ;      //angle
float d = 20 ;   // dia of the circle


void setup() {
  translate(width/2,height/2);
  size(600, 600, P3D);
  background(0);
  
  //spout = new Spout(this);
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
}

void draw() { 
  
  //spout.sendTexture();
  // Blur element
  fill(0, 25);
  rect(0, 0, width, height);
  noFill();
  
  translate(width/2, height/2);
  rotate(PI/2);



  float  u = 10 ; // multiply factor for  amp
  float Am = amp.analyze()*u;     //


// ------ adds forward and reverse acceleation 
  if (Am > u) {
    aAcc *= -1.5;
  } else {
    aAcc *=  1;
  }

  float x = r *sin(a);     
  float y = r *cos(a);
  
  float R = map(a, 0, 360, 0, 255);      // color 
  fill(255-R, R, 120);
  noStroke();
  
  // ------ number of circles , with exponential increase in the dist
  for (int i =1; i <= 4; i ++) {
    ellipse(x*Am, y*i, d, d);
    ellipse(-x*Am, -y*i, d, d);
    x = x*Am;    // bring it closer to the center by mult by Am(0-1)
    y = y*Am;    
  }


/// bloody fucking physics engine .
  a += aVel;
  aVel += aAcc;
  aVel =constrain(aVel, 0, 0.2*Am);    
  
}