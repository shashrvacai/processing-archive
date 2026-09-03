import processing.sound.*;
//import spout.*;

Amplitude amp;
AudioIn in ;


int c=0;
float angle=0;
PVector pos, nOff ;

void setup() {
  //spout = new Spout(this);   ////  ----  Spout
  //spout.createSender("Spout Processingtest");
  
  size(1000, 1000);
  surface.setResizable(true);
  noStroke();
  rectMode(CENTER);
  
  pos = new PVector(width/2, height/2);
  nOff = new PVector(random(10000), random(1000)); 
  
  amp = new Amplitude(this);  
  in = new AudioIn(this, 0);
  in.start();  
  amp.input(in);
}

void draw() {
  //spout.sendTexture();
  float aa =  amp.analyze()/10;
  translate(width/2 , height/2);
  
  pos.x = map(noise(nOff.x),0,1,0,width);
  pos.y = map(noise(nOff.y),0,1,0,height);
  nOff.add(aa,aa,0);
  
  c=40;
  float rSub=map(pos.x, 0, width, 20, 40);
  float aAdd=map(pos.y, 0, height, PI/10, PI/10);
  //float rSub=10 ;    // number of circles
  //float aAdd=PI/48;   // amount of rotation
  circle(width*2,height/2, rSub, angle, aAdd);


  angle+=aa;
}
void circle(float radius,float h_, float rSub, float angle, float aAdd) {
  pushMatrix();
  do {
    fill(c, 0, 85);
    c=255-c;
    ellipse(0, 0, radius, radius);
    radius-=rSub;
    angle+=aAdd;
    float r=rSub*1;
    float x=cos(angle+aAdd)*r;
    float y=cos(angle+aAdd)*r;
    translate(x, y);
  } while (radius>=1);
  popMatrix();
}
