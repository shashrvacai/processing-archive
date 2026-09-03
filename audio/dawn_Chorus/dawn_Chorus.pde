import oscP5.*;
OscP5 oscP5;
import processing.sound.*;

Amplitude amp ;
AudioIn in;
float theta = 0;
float easing = 0.05;
float x =0;
float gap = 6 ;
int pSides = 4;
float daCh1 = 0 ,daCh2 = 0,daCh3 = 0,daCh4 = 4,daCh5 = 0,daCh6 = 0 ; 

void setup() {
  size(1000, 1000);
  background(0);
  rectMode(CENTER);
  
  //OSC messages
   oscP5 = new OscP5(this, 9600);   


//Audio in 
  amp = new Amplitude(this);
  in  = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

void draw() {
    pushMatrix(); 
    blendMode(BLEND);
  translate(width/2, height/2);  
  fill(0,int(daCh5));
  noStroke();
  rect(0, 0, width, height);
  popMatrix();
  
  
  float a = daCh3;
  float da = a - x ;
  x+= da *easing ;
  
  
  pSides = (int)daCh1;                                  // num of the dides
  gap = (int)daCh4;
  
 theta = map(sin(x), -1,1,-TWO_PI, TWO_PI);
  
  pushMatrix();
  noFill();
  stroke(255);
  strokeWeight(daCh2);
 // blendMode(DIFFERENCE);

  translate(width/2, height/2);
  for (int i = width; i > 0; i -= gap) {
    rotate(theta);
    polygon(0,0,i,pSides);    
  }    
  popMatrix();
  
      
  pushMatrix();
  noFill();
  stroke(255);
  strokeWeight(daCh2);
 // blendMode(DIFFERENCE);

  translate(width/2, height/2);
  for (int i = width; i > 0; i -= gap) {
    rotate(-theta);
    polygon(0,0,i,pSides);    
  }  
  popMatrix();

  //theta+= x ;
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
