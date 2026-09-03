
import processing.sound.*;
//import spout.*;

float a  =0 ;
int inc = 50 ;

PVector pos, nOff ;

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
  surface.setResizable(true);
  smooth();
  background(0);
  
  pos = new PVector(width/2,height/2);
  nOff = new PVector(random(10000),random(1000));
}

void DRR(float x_, float y_, float sz_, float r_  ) {
  translate(x_, y_);
  rotate(r_);
  
  ellipse( sz_, sz_,10,10);
  resetMatrix();
}

void draw() {
  //spout.sendTexture();
  float aa =  amp.analyze();
  
  noStroke();  
  fill(0,5);
  rect(0,0,width,height);
  noFill();
  
   
  
  pos.x = map(noise(nOff.x),0,1,0,width);
  pos.y = map(noise(nOff.y),0,1,0,height);
  nOff.add(aa,aa,0);
  PVector walker = new PVector(pos.x, pos.y);
  
  for (int x = 0; x < width+inc; x+= inc ) {
    for (int y = 0; y < height+inc; y+= inc ) {
      DRR( x ,  y, 20,a + x + y);
      PVector pos = new PVector(x,y);
     PVector dist = pos.sub(walker);
     float d = dist.mag();
     float Sw = map(d ,0, 2*width, 40,0);
     strokeWeight(Sw);
     stroke(Sw*4,5,255-Sw*4);
     noFill();
     //fill(255);
    }
  }
  
  a+= 0.03; 
}
