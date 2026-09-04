// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Basic example of falling rectangles

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// A reference to our box2d world
Box2DProcessing box2d;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;
// A list for all of our rectangles
ArrayList<Box> boxes;

void setup() {
  size(700, 500);
  surface.setResizable(true);
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, -10);

  // Create ArrayLists	
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();

  // Add a bunch of fixed boundaries
  boundaries.add(new Boundary(0, height/2, 10, height));  // x, y w,h 
  boundaries.add(new Boundary(width/2, height, width, 10));
  boundaries.add(new Boundary(width,height/2, 10, height));
  boundaries.add(new Boundary(350,height, 200, height));
}

void draw() {
  background(255);
  
  if (mousePressed){
    println(mouseX,mouseY);
  }
  // We must always step through time!
  box2d.step();

  // Boxes fall from the top every so often
  if (random(1) < 0.2) {
    Box p = new Box(width/2, 30);
    boxes.add(p);
  }

  // Display all the boundaries
  for (Boundary wall : boundaries) {
    blendMode(BLEND);
    wall.display();
  }
  
  rect(width/2 , height/2 , width, 100);

  // Display all the boxes
  for (Box b : boxes) {
    blendMode(DIFFERENCE);
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
