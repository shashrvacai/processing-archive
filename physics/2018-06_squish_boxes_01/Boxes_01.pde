import processing.sound.*;

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;


Amplitude amp ;
AudioIn in ;
Box2DProcessing box2d;

ArrayList<Boundary> bound ;
ArrayList<Box> boxes ;

void setup() {
  size(1000, 1000);
  smooth();
  background(255);
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in); 


  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);

  bound= new ArrayList<Boundary>();
  boxes = new ArrayList<Box>();


  bound.add(new Boundary(width/2, height/3, width/2-250, 10));
  bound.add(new Boundary(3*width/4, height/2, width/2-100, 10));
  bound.add(new Boundary(width/4, height-150, width/2-100, 10));
}

void draw() {
  float aa = amp.analyze();
  
  noStroke();
  fill(255,10);
  rect(0,0,width*2,height*2);
  noFill();
  
  box2d.step();

  if (aa> 0.08) {
    Box p = new Box(mouseX,mouseY);
    boxes.add(p);
  }
  for (Boundary wall : bound) {

    //wall.show();
  }
  for (Box b : boxes) {
    b.show();
  }

  for (int i =boxes.size()-1; i >=0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }
}
