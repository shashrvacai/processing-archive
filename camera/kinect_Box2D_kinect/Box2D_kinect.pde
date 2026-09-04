import netP5.*;
import oscP5.*;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

import processing.sound.*;
//import spout.*;

int sin = 18;
float amps[];
OscP5 O ;

//Spout spout;

Amplitude  amp ;
AudioIn in ;

// A reference to our box2d world
Box2DProcessing box2d;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;
// A list for all of our rectangles
ArrayList<Box> boxes;

void setup() {
  size(640,360);
  surface.setResizable(true);
  
  //spout = new Spout(this);

  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in. start();
  amp.input(in);

  amps = new float[sin];
  O = new OscP5(this, 12346);
  O.plug(this, "setAmps", "/setAmps");
  
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, -10);

  // Create ArrayLists	
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();

  // Add a bunch of fixed boundaries
  boundaries.add(new Boundary(width/4,height-5,width/2-50,10));
  boundaries.add(new Boundary(3*width/4,height-50,width/2-50,10));
}

public void setAmps(float[] s) {
  for (int i  = 0; i < amps.length; i++) {
    amps[i]= s[i];
  }
}

void draw() {
  float aa =  amp.analyze();
  //spout.sendTexture();
  
  noStroke();
  fill(0,5);
  rectMode(LEFT);
  rect(0, 0, width, height);
  noFill();
  
   float x = map(amps[0], -1, 1, 0, width) ;     /// attractor  X ;
  float y = map(amps[2], -1, 1, 0, height) ;      ///  attractor Y

  float a3 = map(amps[3],-1,1,0,255) ;
  float a4 = map(amps[4],-1,1,0,255) ;
  float a5 = map(amps[5],-1,1,0,255) ;
  float xu = map(amps[6],-1,1,0,width) ;      /// emitter X ;
  float yu = map(amps[8],-1,1,0,height) ;    /// emitter Y ; 
  float a9 = map(amps[9],-1,1,0,255);
  float a10 = map(amps[10],-1,1,0,255);

  // We must always step through time!
  box2d.step();

  // Boxes fall from the top every so often
  if (aa > 0.05) {
    Box p = new Box(x,y);      //     add the kinect X ,Y positions  
    boxes.add(p);
  }
  if (mousePressed){
  Box p = new Box(mouseX,mouseY);      //     add the kinect X ,Y positions  
    boxes.add(p);
}
  

  // Display all the boundaries
  for (Boundary wall: boundaries) {
    wall.display();
  }

  // Display all the boxes
  for (Box b: boxes) {
    b.display();
  }

  // Boxes that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }
}
