import processing.sound.*;
//import spout.*;

float diameter = 64;
int steps = 5;
PVector follower ,pos,nOff;

//Spout spout;

Amplitude  amp ;
AudioIn in ;

void setup() {
  size(800, 600);
//  smooth();
  ellipseMode(CENTER);
  background(64);
  follower = new PVector(mouseX, mouseY);
  
  pos = new PVector(width/2,height/2);
  nOff = new PVector(random(10000),random(1000));
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in. start();
  amp.input(in);
  
}
void draw() {
  
  float aa =  amp.analyze()*10;
  
  pos.x = map(noise(nOff.x),0,1,0,width);
  pos.y = map(noise(nOff.y),0,1,0,height);
  nOff.add(aa,aa,0);
  
  noStroke();
  fill(0);
  rect(0,0,width,height); 
  noFill(); 
  
  stroke(255);
   
  PVector mouse = new PVector(pos.x,pos.y);
  PVector middle = new PVector(width/2, height/2);
  mouse.sub(middle);
  mouse.mult(aa);
  mouse.add(middle);
  follower.add(PVector.mult(PVector.sub(mouse,follower),0.05));     /// amplification factor 
  
  recursiveRoutine(follower, new PVector(width/2, height/2), diameter, 0);
}

void recursiveRoutine(PVector location, PVector center, float diam, int step) {
  if (step<steps) {
    PVector arm = PVector.sub(location, center);
    float angle = atan2(arm.y, arm.x);
    float radius = arm.mag();
    for (int i=0; i<6; i++) {
      float newAngle = angle + TWO_PI*i/6;
      PVector newArm = new PVector(radius*cos(newAngle), radius*sin(newAngle));
      newArm.add(center);
      ellipse(newArm.x, newArm.y, diam, diam);
      float newNewAngle = angle * 3 * (-1 + (step%2)*2);
      float newRadius = radius*0.37;
      float newDiam = diam*0.4;
      PVector newNewArm = new PVector(newRadius*cos(newNewAngle), newRadius*sin(newNewAngle));
      newNewArm.add(newArm);
      recursiveRoutine(newNewArm, newArm, newDiam, step+1);
    }
  }
}
