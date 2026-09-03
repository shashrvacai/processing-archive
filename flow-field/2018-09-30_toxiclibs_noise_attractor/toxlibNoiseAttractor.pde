import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
  
import processing.sound.*;
Amplitude amp;
AudioIn in;
 
int NUM_PARTICLES = 1450;

PVector pos, nOff ;
 
VerletPhysics2D physics;
AttractionBehavior mouseAttractor , ran ;
 
Vec2D mousePos , ranWaker;
 
void setup() {
  size(680, 700,P3D);
  surface.setResizable(true);
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
    ellipse(p.x, p.y, 2, 2);
  }
  
  
  
  
  pos.x = map(noise(nOff.x),0,1,0,width);
  pos.y = map(noise(nOff.y),0,1,0,height);
  nOff.add(0.01,0.01,0);
   //ellipse(pos.x, pos.y, 48, 48);
   

}
 
 void addParticle(float s_) {
  VerletParticle2D p = new VerletParticle2D(Vec2D.randomVector().scale(5).addSelf(pos.x, pos.y));
  physics.addParticle(p);
  // add a negative attraction force field around the new particle
  physics.addBehavior(new AttractionBehavior(p, 20,s_, 0.01f));
  println(-7.2f);
}
 
 
void keyPressed() {
      mousePos = new Vec2D(pos.x, pos.y);
  // create a new positive attraction force field around the mouse position (radius=250px)
  mouseAttractor = new AttractionBehavior(mousePos, 250, 0.9f);
  physics.addBehavior(mouseAttractor); 
 
}
 

 
void keyReleased() {
  // remove the mouse attraction when button has been released
  physics.removeBehavior(mouseAttractor);
}
