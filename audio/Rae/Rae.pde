 // map to max
//Add OSn 

// add switches of lines rectangles 

import processing.sound.*;
float factor = 1000 ;
float xoff = 0.0;
float lineY = 0 ;

float flipC = 1 ;
boolean flip = true ;

Amplitude amp ;
AudioIn in;

void setup() {
  size(1000, 1000);
  background(0);

  amp = new Amplitude(this);
  in  = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

void draw() {
  rectMode(CENTER);
  
  
  //------------------------------------------------BG opacity
  pushMatrix();                      
    translate(width/2, height/2);
    blendMode(BLEND);
    noStroke();
    fill(0, 10);
      rect(0, 0, width, height);
    noFill();
  popMatrix();


// --------------------------audio and noise inputs
  float a = amp.analyze()*factor;
  xoff  += a/10000;
  float n = noise(xoff) * width;                 // original noise value
  float n2 = noise(xoff*2) * width;               // 2x noise value
  float n3 = noise(xoff*3) * width;               // 2x noise value

  float freq = (int)map(mouseX, 0, width, 2, 50);   // metronome of the visuals
  if (flipC %freq ==0) { 
    flip = !flip ;
  }

// ------------------------ellpise colored based flip  
  if (flip) {
    stroke(0);  
    fill(255);
  } else {
    stroke(255);  
    fill(0);
  }
  ellipse(n, height/2, a, a);
  ellipse(width-n, height/2, a, a);

 // ----------------------------lines at original noise
  blendMode(DIFFERENCE);
  stroke(255, map(a, 0, factor, 0, 255));
  strokeWeight(0.5);
  fill(255);
  rect(width/2, n, width, 10);
  rect(width/2, height-n, width, 10);


// ---------------------------- lines amplified by 2 
  //fill(2);
  rect(width/2, n2, width, 10);
  rect(width/2, height-n2, width, amp.analyze()*100);
  
  // ---------------------------- lines amplified by 3 
  //fill(2);
  rect(width/2, n3, width, 10);
  rect(width/2, height-n3, width, amp.analyze()*100);


// linear increasing Y  lines 

  //rect(0, lineY, width,10);
  if (lineY >= height) lineY = 0 ;
  else if (lineY <= 0) lineY = height ;
  lineY -= amp.analyze()*100;


// ------- random square 
  if (mousePressed) {
    fill(255);
    rect(random(width), random(height), random(width/2), random(width/2));
  }

  flipC ++;
}
