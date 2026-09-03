//import processing.sound.*;

//Amplitude amp ;
//AudioIn in ;

import netP5.*;
import oscP5.*;
//import spout.*;

//Spout spout;

int sin = 18;
float amps[];
OscP5 O ;


boolean debug = true;

FF ff ;
ArrayList<Vehicle> vs ;
float AA = 0 ;



void setup() {
  // frameRate(30);
  size(1000, 1000, OPENGL);


  // ---  OSc   
  amps = new float[sin];
  O = new OscP5(this, 12346);
  O.plug(this, "setAmps", "/setAmps");

  ////  ----  Sput
  //spout = new Spout(this);
  //spout.createSender("Spout Processingtest");

  //amp = new Amplitude(this);
  //in = new AudioIn (this,0);
  //in.start();
  //amp.input(in);

  ff = new FF(60);
  vs = new ArrayList<Vehicle>();
  for (int i = 0; i < 340; i++) {
    vs.add(new Vehicle(new PVector(random(width), random(height)), random(5, 0), random(0.1, 0.5)));
  }
}

public void setAmps(float[] s) {
  for (int i  = 0; i < amps.length; i++) {
    amps[i]= s[i];
  }
}


void draw() {
  //spout.sendTexture();
  //fill(255, 150);
  //noStroke();
  //rect(0, 0, width, height);
  //noFill();
  background(255);

  float x = map(amps[0], 1, -1, 0, width); 
  float y = map(amps[1], 1, -1, 0, height); 
  float z = map(amps[3], 1, -1, 20, 180);

  //float AA  = amp.analyze()*10;

  stroke(0);

  PVector sA = new PVector(mouseX, mouseY);
  ff.init(AA);
  //if (debug) ff.display();

  for (Vehicle v : vs) {
    //v.applyf(sA);
    v.follow(ff);
    v.aB(vs,x,y);
    v.run();
  }
}



void keyPressed() {
  if (key == ' ') {
    debug = !debug;
  }  

  background(255);
}



void mouseDragged() {
  AA += 0.01;
}