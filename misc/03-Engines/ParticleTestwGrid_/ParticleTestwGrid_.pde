
import com.thomasdiewald.liquidfun.java.DwWorld;
import com.thomasdiewald.liquidfun.java.DwParticleEmitter;

import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.DwLiquidFX;
import org.jbox2d.collision.shapes.ChainShape;
import org.jbox2d.collision.shapes.PolygonShape;
import org.jbox2d.common.Color3f;
import org.jbox2d.common.Vec2;
import org.jbox2d.dynamics.Body;
import org.jbox2d.dynamics.BodyDef;
import org.jbox2d.particle.ParticleGroupDef;
import org.jbox2d.particle.ParticleType;
import processing.core.*;
import processing.opengl.PGraphics2D;
import org.jbox2d.common.MathUtils;
import processing.sound.*;

Amplitude amp ;   
AudioIn in;

boolean vis= true, pow = true, ela = true, ten= true , grav = false ;

int viewport_w = 720;
int viewport_h = 1280;
int viewport_x = 230;
int viewport_y = 0;

boolean UPDATE_PHYSICS = true;


DwParticleEmitter emitter0;
DwParticleEmitter emitter1;
DwParticleEmitter emitter2;
DwParticleEmitter emitter3;

BodyDef bd ;
Body ground;
PolygonShape shape ;
ParticleGroupDef pd ;

DwWorld world;

float dimx, dimy, dimxh, dimyh ;

public void settings() {
  size(viewport_w, viewport_h, P2D);
  smooth(8);
}

public void setup() { 
  surface.setLocation(viewport_x, viewport_y);
  reset();
  frameRate(60);
  amp = new Amplitude(this);
  in  = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

public void release() {
  if (world != null) world.release(); 
  world = null;
}



public void reset() {   
  release();
  world = new DwWorld(this, 18);

  dimx = world.transform.box2d_dimx;
  dimy = world.transform.box2d_dimy;

  dimxh = dimx/2;
  dimyh = dimy/2;

  {
    bd = new BodyDef();
    ground = world.createBody(bd);
    ChainShape shape = new ChainShape();
    Vec2[] vertices = {new Vec2(-dimxh, 0), new Vec2(dimxh, 0), new Vec2(dimxh, dimy), new Vec2(-dimxh, dimy)};
    shape.createLoop(vertices, 4);
    ground.createFixture(shape, 0.0f);
    world.bodies.add(ground, false, color(0), true, color(0), 4f);
    ground.setGravityScale(-40);
    println(ground.getGravityScale());
  }
  {
    shape = new PolygonShape();
    pd = new ParticleGroupDef();


    pd.flags = ParticleType.b2_elasticParticle;
    if (vis == true ) {    
      pd.flags =ParticleType.b2_viscousParticle;
    }
    if (pow == true ) {    
      pd.flags =ParticleType.b2_powderParticle;
    }
    if (ten == true ) {    
      pd.flags =ParticleType.b2_tensileParticle;
    }
    if (ela == true ) {    
      pd.flags = ParticleType.b2_elasticParticle;
    }

    pd.flags = 0
      | ParticleType.b2_waterParticle
      | ParticleType.b2_colorMixingParticle
      ;

    float sx = dimx/16;
    float sy = dimy /16;
    

    emitter0 = new DwParticleEmitter(world, world.transform);
    emitter1 = new DwParticleEmitter(world, world.transform);
    emitter2 = new DwParticleEmitter(world, world.transform);
    emitter3 = new DwParticleEmitter(world, world.transform);

    float hsb_s = 100;
    float hsb_b = 100;
    colorMode(HSB, 360, 100, 100);

    int flags = 0;
    flags |= ParticleType.b2_waterParticle;
    flags |= ParticleType.b2_viscousParticle;
    flags |= ParticleType.b2_colorMixingParticle;

    emitter0.setInScreen( 0, 0, 0, 0, color(  5, hsb_s, hsb_b), flags);
    emitter1.setInScreen( 100, 100, 300, 0, color( 55, hsb_s, hsb_b), flags);
    emitter2.setInScreen(width/2, height-100, 300, -175, color(115, hsb_s, hsb_b), flags);
    emitter3.setInScreen(width/2, height-10, 300, 140, color(230, hsb_s, hsb_b), flags);
     
     
    for(float i = -dimx/2+dimx/16 ; i < dimx/2 ; i+= dimx/8){ 
      for(float j =dimy/8 ; j < dimy ; j+= dimy/8){ 
    shape.setAsBox(sx/2, sy/2, new Vec2(i, j), 0);
    pd.shape = shape;
    pd.setColor(new Color3f(255-i, 0.2f, i*i));
    world.createParticleGroup(pd);
    }    
  }
  }
  //  shape.setAsBox(sx, sy, new Vec2(+dimx, dimy), 0);
  //  pd.shape = shape;
  //  pd.setColor(new Color3f(1.00f, 0.2f, 0.00f));
  //  world.createParticleGroup(pd);
  //}
}

public void draw() {
  float a = amp.analyze()*2;
  if (UPDATE_PHYSICS) {
    addParticles();
    world.update();
  }

  PGraphics2D canvas = (PGraphics2D) this.g;
  canvas.background(32);
  canvas.pushMatrix();
  world.applyTransform(canvas);
  world.drawBulletSpawnTrack(canvas);
   {
    float mXX = map(mouseX, 0, width, -9.8, 9.8);
    float mYY = map(mouseY, 0, height, 9.8, -9.8);
    if (grav == true) {
      world.setGravity(new Vec2(mXX, mYY));
    } else {
      world.setGravity(new Vec2(0, 0));
    }                                         // gravity 
    world.display(canvas);
    world.setParticleDamping(a);               //     damping
  }
  canvas.popMatrix();
}

int particle_counter = 0;
public void addParticles() {

  emitter2.emit_vel = 25 * (sin(particle_counter/200f + PI) * 0.5f  + 0.5f);
  //emitter3.emit_vel = 25 * (sin(particle_counter/200f) * 0.5f  + 0.5f);

  if (mousePressed)
  {
    //emitter0.emitParticles(2);
    //emitter1.emitParticles(2);
    emitter2.emitParticles(2);
    //emitter3.emitParticles(2);
  }
  particle_counter++;
}
void keyPressed() {
  if (key =='v') {     
    vis = !vis ;
  } else if (key =='t') {     
    ten = !ten ;
  } else if (key =='e') {     
    ela = !ela ;
  } else if (key =='p') {     
    pow = !pow ;
  } else if (key =='g') {     
    grav = !grav ;
  } else if(key == 'r'){
   reset(); ;
  } 
}
