
import processing.sound.*;
//import spout.*;


int n = 30 ;
float[] sDia = new float[n];
float[] d= new float[n];
float incDia, x, y, sd;
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
  
  
  size(600, 600);
  surface.setResizable(true);
  background(255);
  stroke(0);
  noFill();
  x = width/2 ; 
  y = height/2 ;
  incDia =100;

  for (int i = 0; i < n; i++) {
    sDia[i] =  d[i] = sd ;
    sd += incDia ;
  }
  sDia[0] = incDia/2 ;
  pos = new PVector(width/2, height/2);
  nOff = new PVector(random(10000), random(1000));
}

void draw() {
  //spout.sendTexture();
  float aa =  amp.analyze();
  
  background(255);
  pos.x = map(noise(nOff.x),0,1,0,width);
  pos.y = map(noise(nOff.y),0,1,0,height);
  nOff.add(aa,aa,0);
  
  noFill();
  float xx = map(pos.x, 0, width, 35, -35);
  float yy = map(pos.y, 0, height, 35, -35);
  pushMatrix();
  translate(width/2-100, height/2-100);
  for (int i = 0; i < n; i++) {
    stroke(0);
    strokeWeight(40);
    ellipse(0, 0, d[i], d[i]);
    stroke(255);
    strokeWeight(40);
    ellipse(xx, yy, d[i], d[i]);
    d[i]++;
    if (d[i] > (sDia[i]+incDia)) {
      d[i] = sDia[i];
    }
  }
  popMatrix();
}
