
import java.util.ArrayList;

import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.softbodydynamics.DwPhysics;
import com.thomasdiewald.pixelflow.java.softbodydynamics.constraint.DwSpringConstraint;
import com.thomasdiewald.pixelflow.java.softbodydynamics.particle.DwParticle;
import com.thomasdiewald.pixelflow.java.softbodydynamics.particle.DwParticle2D;
import com.thomasdiewald.pixelflow.java.softbodydynamics.softbody.DwSoftBody2D;
import com.thomasdiewald.pixelflow.java.softbodydynamics.softbody.DwSoftGrid2D;
import com.thomasdiewald.pixelflow.java.utils.DwStrokeStyle;

import processing.core.*;
import processing.opengl.PGraphics2D;

// Controls:
// LMB: drag particles
// MMB: drag + fix particles to a location
// RMB: disable springs, to rip the cloth


int viewport_w = 720;
int viewport_h = 1280;
int viewport_x = 230;
int viewport_y = 0;


// physics parameters
DwPhysics.Param param_physics = new DwPhysics.Param();

DwParticle.Param param_particle_cloth = new DwParticle.Param();
// spring parameters
DwSpringConstraint.Param param_spring_cloth = new DwSpringConstraint.Param();
// physics simulation
DwPhysics<DwParticle2D> physics;
DwSoftGrid2D cloth = new DwSoftGrid2D();

// list, that wills store the cloths
ArrayList<DwSoftBody2D> softbodies = new ArrayList<DwSoftBody2D>();


PGraphics2D tex_cloth_left;



// 0 ... default: particles, spring
// 1 ... tension
int DISPLAY_MODE = 0;

// entities to display
boolean DISPLAY_PARTICLES      = !true;
boolean DISPLAY_MESH           = true;
boolean DISPLAY_SRPINGS        = true;

boolean DISPLAY_SPRINGS_STRUCT = !true;
boolean DISPLAY_SPRINGS_SHEAR  = !true;
boolean DISPLAY_SPRINGS_BEND   = !true;

boolean UPDATE_PHYSICS         = true;

// first thing to do, inside draw()
boolean NEED_REBUILD = false;

public void settings() {
  size(viewport_w, viewport_h, P2D); 
  smooth(8);
}


public void setup() {
  surface.setLocation(viewport_x, viewport_y);

  // main library context
  DwPixelFlow context = new DwPixelFlow(this);
  context.print();
  //    context.printGL();

  physics = new DwPhysics<DwParticle2D>(param_physics);

  param_physics.GRAVITY = new float[]{ 0, 0.2f };
  param_physics.bounds  = new float[]{ 0, 0, viewport_w, height };
  param_physics.iterations_collisions = 4;
  param_physics.iterations_springs    = 4;

  // particle parameters for Cloth1
  param_particle_cloth.DAMP_BOUNDS    = 0.50000f;
  param_particle_cloth.DAMP_COLLISION = 0.99999f;
  param_particle_cloth.DAMP_VELOCITY  = 0.99100f; 


  // spring parameters for Cloth1
  param_spring_cloth.damp_dec = 0.999999f;
  param_spring_cloth.damp_inc = 0.000199f;

  cloth.CREATE_STRUCT_SPRINGS = true;
  cloth.CREATE_SHEAR_SPRINGS  = true;
  cloth.CREATE_BEND_SPRINGS   = true;
  cloth.bend_spring_mode      = 0;
  cloth.bend_spring_dist      = 3;

  createBodies();


  frameRate(60);
}



public void createBodies() {

  physics.reset();
  softbodies.clear();
  softbodies.add(cloth);

  cloth.setParticleColor(color(  0, 180, 255, 128));
  cloth.setMaterialColor(color(  0, 280, 255, 128));
  cloth.setParam(param_particle_cloth);
  cloth.setParam(param_spring_cloth);

  // both cloth are of the same size
  int nodes_x = 22;
  int nodes_y =60;
  int nodes_r = 16;
  int nodes_start_x = 0;
  int nodes_start_y = 80;

  int   num_cloth = softbodies.size();
  float cloth_width = 2 * nodes_r * (nodes_x-1);
  float spacing = ((viewport_w ) - num_cloth * cloth_width) / (float)(num_cloth+1);  

  // create all cloth in the list
  for (int i = 0; i < num_cloth; i++) {
    nodes_start_x += spacing + cloth_width * i;

    DwSoftGrid2D cloth = (DwSoftGrid2D) softbodies.get(i);
    cloth.create(physics, nodes_x, nodes_y, nodes_r, nodes_start_x, nodes_start_y);
    for (int v = 0 ;v <=cloth.nodes_x-1 ;v+=3){
    cloth.getNode(              v, 0).enable(false, false, false); // fix node to current location
    // fix node to current location
    }
    cloth.createShapeParticles(this);
  }
}





public void draw() {

  if (NEED_REBUILD) {
    createBodies();
    NEED_REBUILD = false;
  }
  updateMouseInteractions();
  // update physics simulation
  physics.update(1);
  // render
  background(DISPLAY_MODE == 0 ?  255 : 92);

  // 3) create mesh, solid
  if (DISPLAY_MESH) {
    for (DwSoftBody2D body : softbodies) {
      body.createShapeMesh(this.g);
    }
  }
  // 2) mesh, solid
  if (DISPLAY_MESH) {
    for (DwSoftBody2D body : softbodies) {
      body.displayMesh(this.g);
    }
  }
  // 3) springs
  if (DISPLAY_SRPINGS) {
    for (DwSoftBody2D body : softbodies) {
      body.shade_springs_by_tension = (DISPLAY_MODE == 1);
      body.displaySprings(this.g, new DwStrokeStyle(color(255, 90, 30), 1f), DwSpringConstraint.TYPE.BEND);
     //body.displaySprings(this.g, new DwStrokeStyle(color( 70, 140, 255), 1.6f), DwSpringConstraint.TYPE.SHEAR);
     body.displaySprings(this.g, new DwStrokeStyle(color(  0, 0, 0), 0.2f), DwSpringConstraint.TYPE.STRUCT);
    }
  }
  //DwParticle2D[] particles = physics.getParticles();           // move stuff around 
  //particles[50].cx = mouseX;
  //particles[50].cy = mouseY;

}




// this resets all springs and particles, to some of its initial states
// can be used after deactivating springs with the mouse
public void repairAllSprings() {
  for (DwSoftBody2D body : softbodies) {
    for (DwParticle pa : body.particles) {
      pa.setCollisionGroup(body.collision_group_id);
      pa.setRadiusCollision(pa.rad());
      pa.enableAllSprings(true);
    }
  }
}
// update all springs rest-lengths, based on current particle position
// the effect is, that the body keeps the current shape
public void applySpringMemoryEffect() {
  ArrayList<DwSpringConstraint> springs = physics.getSprings();
  for (DwSpringConstraint spring : springs) {
    spring.updateRestlength();
  }
}



//////////////////////////////////////////////////////////////////////////////
// User Interaction
//////////////////////////////////////////////////////////////////////////////

DwParticle particle_mouse = null;

public DwParticle findNearestParticle(float mx, float my) {
  return findNearestParticle(mx, my, Float.MAX_VALUE);
}

public DwParticle findNearestParticle(float mx, float my, float search_radius) {
  float dd_min_sq = search_radius * search_radius;
  DwParticle2D[] particles = physics.getParticles();
  DwParticle particle = null;
  for (int i = 0; i < particles.length; i++) {
    float dx = mx - particles[i].cx;
    float dy = my - particles[i].cy;
    float dd_sq =  dx*dx + dy*dy;
    if ( dd_sq < dd_min_sq) {
      dd_min_sq = dd_sq;
      particle = particles[i];
    }
  }
  return particle;
}

public ArrayList<DwParticle> findParticlesWithinRadius(float mx, float my, float search_radius) {
  float dd_min_sq = search_radius * search_radius;
  DwParticle2D[] particles = physics.getParticles();
  ArrayList<DwParticle> list = new ArrayList<DwParticle>();
  for (int i = 0; i < particles.length; i++) {
    float dx = mx - particles[i].cx;
    float dy = my - particles[i].cy;
    float dd_sq =  dx*dx + dy*dy;
    if (dd_sq < dd_min_sq) {
      list.add(particles[i]);
    }
  }
  return list;
}


public void updateMouseInteractions() {

  // deleting springs/constraints between particles
  if (DELETE_SPRINGS) {
    ArrayList<DwParticle> list = findParticlesWithinRadius(width/2,height/2, DELETE_RADIUS);
    for (DwParticle tmp : list) {
      tmp.enableAllSprings(false);
      tmp.collision_group = physics.getNewCollisionGroupId();
      tmp.rad_collision = tmp.rad;
    }
  } else {
    if (particle_mouse != null) {
      float[] mouse = {mouseX, mouseY};
      particle_mouse.moveTo(mouse, 0.2f);
    }
  }
}


boolean DELETE_SPRINGS = false;
float   DELETE_RADIUS = 100;

public void mousePressed() {
 
    if (mouseButton == RIGHT ) DELETE_SPRINGS = true; 
    if (!DELETE_SPRINGS) {
      particle_mouse = findNearestParticle(mouseX, mouseY, 100);
      if (particle_mouse != null) particle_mouse.enable(false, false, false);
    }
  
}

public void mouseReleased() {
  if (!DELETE_SPRINGS && particle_mouse != null) {
    if (mouseButton == LEFT  ) particle_mouse.enable(true, true, true);
    if (mouseButton == CENTER) particle_mouse.enable(true, false, false);
    particle_mouse = null;
  }
  if (mouseButton == RIGHT ) DELETE_SPRINGS = false;
}

public void keyReleased() {
  if (key == 's') repairAllSprings();
  if (key == 'm') applySpringMemoryEffect();

  if (key == 'r') createBodies();
  if (key == '1') DISPLAY_MODE = 0;
  if (key == '2') DISPLAY_MODE = 1;

  if (key == '3') DISPLAY_PARTICLES = !DISPLAY_PARTICLES;
  if (key == '4') DISPLAY_MESH      = !DISPLAY_MESH;
  if (key == '5') DISPLAY_SRPINGS   = !DISPLAY_SRPINGS;

  if (key == ' ') UPDATE_PHYSICS = !UPDATE_PHYSICS;
}
