
import java.util.Iterator;
import toxi.geom.*;
import toxi.physics2d.*;

PFont font;
// The font must be located in the sketch's 
// "data" directory to load successfully


VerletPhysics2D physics;
VerletParticle2D selected=null;

// squared snap distance for picking particles
float rSpin = 250 ; // raduis of random walker 
float aSpin = 0 ; // angle of rotating random walker 
float snapDist=10*10;
PVector pos, nOff ;
float numChain= 5 ;

void setup() {
  String[] fontList = PFont.list();
printArray(fontList);

  font = createFont("TelefonTrial-Medium", 132);
  textFont(font);
  textAlign(CENTER, CENTER);
  size(1000, 1000);
  smooth();
  background(0);
  pos = new PVector(width, height);
  nOff = new PVector(random(10000), random(1000));

  physics=new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0, 0, width, height));
  // create 10 particle strings of 20 particles each
  for (int i=0; i<1; i++) {
    for (int j=0; j<height; j+=width/numChain) {
      ParticleString2D s=new ParticleString2D(physics, new Vec2D(0, j), Vec2D.fromTheta(i*0.*TWO_PI).scaleSelf(20), 50, 1, 0.5);
    }
  }
}

void draw() {
  fill(0, 1);
  rect(0, 0, width, height);
  noFill();
  
  fill(255);
  text("NEON", width/2, height/2);
  
  //random walker

  pos.x = map(noise(nOff.x), 0, 1, 0, width)+ (rSpin*sin(aSpin));
  pos.y = map(noise(nOff.y), 0, 1, 0, height)+(rSpin*cos(aSpin));
  nOff.add(0.001, 0.001, 0);
  //ellipse(pos.x, pos.y, 48, 48); 
  aSpin+=0.005 ;

  physics.update();
  // draw all springs
  for (Iterator i=physics.springs.iterator(); i.hasNext(); ) {
    VerletSpring2D s=(VerletSpring2D)i.next();
    // line(s.a.x,s.a.y,s.b.x,s.b.y);
  }
  // draw all particles
  for (Iterator i=physics.particles.iterator(); i.hasNext(); ) {
    VerletParticle2D p=(VerletParticle2D)i.next();

    // opacity patch 
    Vec2D jj= (p.getVelocity());
    float ringOpaX = map(jj.x, 0, 1, 0, 255);
    float ringOpaY = map(jj.y, 0, 1, 0, 255);

    stroke(ringOpaX/2, 0, ringOpaX);
    fill(ringOpaX/2, 255-ringOpaX/2, ringOpaX);
    //fill(255-ringOpaY,255-ringOpaY/2,0);
    ellipse(p.x, p.y, 20, 20);
  }

  selected=null;
  Vec2D mousePos=new Vec2D(pos.x, pos.y);
  for (Iterator i=physics.particles.iterator(); i.hasNext(); ) {
    VerletParticle2D p=(VerletParticle2D)i.next();
    // if mouse is close enough, keep a reference to
    // the selected particle and lock it (becomes unmovable by physics)
    if (p.distanceToSquared(mousePos)<snapDist) {
      selected=p;
      selected.lock();
      break;
    }
  }

  if (selected!=null) {
    selected.set(pos.x, pos.y);
  }

  if (selected!=null) {
    selected.unlock();
    selected=null;
  }
}

void mousePressed() {
  background(0);
}
