
import java.util.ArrayList;

import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.softbodydynamics.DwPhysics;
import com.thomasdiewald.pixelflow.java.softbodydynamics.constraint.DwSpringConstraint;
import com.thomasdiewald.pixelflow.java.softbodydynamics.particle.DwParticle;
import com.thomasdiewald.pixelflow.java.softbodydynamics.particle.DwParticle2D;
import com.thomasdiewald.pixelflow.java.softbodydynamics.softbody.DwSoftBody2D;
import com.thomasdiewald.pixelflow.java.softbodydynamics.softbody.DwSoftGrid2D;
import com.thomasdiewald.pixelflow.java.utils.DwStrokeStyle;

import controlP5.Accordion;
import controlP5.ControlP5;
import controlP5.Group;
import processing.core.*;
import processing.opengl.PGraphics2D;

// Controls:
// LMB: drag particles
// MMB: drag + fix particles to a location
// RMB: disable springs, to rip the cloth


int viewport_w = 720;
int viewport_h = 1280;


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



public void setup() {
    size(1080, 1440, P2D); 
  smooth(8);

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

public void draw() {

  background(0);
  
  if (NEED_REBUILD) {
    createBodies();
    NEED_REBUILD = false;
  }
  updateMouseInteractions();
  // update physics simulation
  physics.update(1);
  // render


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
