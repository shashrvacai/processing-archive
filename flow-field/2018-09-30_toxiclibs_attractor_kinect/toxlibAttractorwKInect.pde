import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

import org.openkinect.processing.*;

Kinect2 K ;   // k in the kinect object

  
import processing.sound.*;
Amplitude amp;
AudioIn in;


float ksf= 3 ;  // kinect image scale factor 
float dMin = 512 ;
float dMax = 1000 ;
float aX = 0;
float aY = 0 ;
 
int NUM_PARTICLES = 1450;

PVector pos, nOff ;
 
VerletPhysics2D physics;
AttractionBehavior mouseAttractor , ran ;
 
Vec2D mousePos , ranWaker;
 
void setup() {
  size(1280, 1200,P3D);
  surface.setResizable(true);
  K = new Kinect2(this);
  K.initDepth();  // int depth ; 
  K.initDevice();
  
  background(0);
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
  pos = new PVector(width/2,height/2);
  nOff = new PVector(random(10000),random(1000));
 
  // setup physics with 10% drag
  physics = new VerletPhysics2D();
  physics.setDrag(0.05f);
  physics.setWorldBounds(new Rect(0, 0, width, height));
  // the NEW way to add gravity to the simulation, using behaviors
  physics.addBehavior(new GravityBehavior(new Vec2D(0, -0.15f)));
}
 

 
void draw() {
  float aa = 0.5;//amp.analyze();
 
 fill(0,15);
  rect(0,0,width,height);
  noFill();
  
  noStroke();
  fill(255);
  if (physics.particles.size() < NUM_PARTICLES) {
    addParticle(map(aa,0,0.5,0,-5));
  }
  physics.update();
  for (VerletParticle2D p : physics.particles) {
    ellipse(p.x, p.y,16, 2);
  }
  
  
  
  PImage dep =  K.getDepthImage();  // depth img
  //image(dep,0,0);   // test depth image
  int[]  Rdep = K.getRawDepth();

  float sX = 0 ;   /// sum of X 
  float sY = 0 ;   /// sum of Y
  float tP = 0 ;   /// total number of pixels 

  float s = 2;    // skip
  float r = 2;    // range
  for (int x = 0; x < dep.width; x+=s) {
    for (int y = 0; y < dep.height; y+=s) {
      int  i = x + y* dep.width;    // index 
      float b = brightness(dep.pixels[i]);  
      int d = Rdep[i];   // depth index
      float n = map(d, dMin, dMax, 10, 255);
      float si = map(n, 0, 255, s*r, s/r);
      //float si = map(n, 0, 255, s*r, s/r);   ///reverse

      float m = map(b, 0, 255, 8, 50); // mapping brightness values 

      if (d >dMin && d <dMax) {

        fill(n, 255,255-n, 255);   // pink to orange
        noStroke();
        pushMatrix();
        scale(ksf);
        ellipse(x, y, si, si);
        popMatrix();
        sX += x ;
        sY += y ;
        tP ++ ;
      } else {
      }
    }
  }

   aX = (sX /tP)*ksf ;
   aY = (sY /tP)*ksf ;
  fill(125);
  //ellipse(aX, aY, 20, 20);

  pos.x = map(noise(nOff.x),0,1,0,width);
  pos.y = map(noise(nOff.y),0,1,0,height);
  nOff.add(0.01,0.01,0);
   //ellipse(pos.x, pos.y, 48, 48);
   

}
 
 void addParticle(float s_) {
  VerletParticle2D p = new VerletParticle2D(Vec2D.randomVector().scale(5).addSelf(aX,aY));
  physics.addParticle(p);
  // add a negative attraction force field around the new particle
  physics.addBehavior(new AttractionBehavior(p, 20,s_, 0.01f));
  println(-7.2f);
}
 
 
void keyPressed() {
      mousePos = new Vec2D(aX, aY);
  // create a new positive attraction force field around the mouse position (radius=250px)
  mouseAttractor = new AttractionBehavior(mousePos, 750, 0.9f);
  physics.addBehavior(mouseAttractor); 
 
}
 

 
void keyReleased() {
  // remove the mouse attraction when button has been released
  physics.removeBehavior(mouseAttractor);
}
