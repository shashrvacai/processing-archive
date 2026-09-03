/*
 needs
 
 
 --arraylist for chains
 --return to original postoion with ease 
  
*/
// Controls:
// LMB: drag particles
// MMB: drag + fix particles to a location
// RMB: disable springs, to deform objects

import java.util.ArrayList;

import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.softbodydynamics.DwPhysics;
import com.thomasdiewald.pixelflow.java.softbodydynamics.constraint.DwSpringConstraint;
import com.thomasdiewald.pixelflow.java.softbodydynamics.constraint.DwSpringConstraint2D;
import com.thomasdiewald.pixelflow.java.softbodydynamics.particle.DwParticle;
import com.thomasdiewald.pixelflow.java.softbodydynamics.particle.DwParticle2D;
import com.thomasdiewald.pixelflow.java.softbodydynamics.softbody.DwSoftBall2D;
import com.thomasdiewald.pixelflow.java.softbodydynamics.softbody.DwSoftBody2D;
import com.thomasdiewald.pixelflow.java.softbodydynamics.softbody.DwSoftGrid2D;
import com.thomasdiewald.pixelflow.java.utils.DwStrokeStyle;

import processing.core.*;


int  picNum = 129 , viewport_w = 1280 , viewport_h = 720;
int gui_w = 200 , gui_x = 20 ,gui_y = 20;

DwPhysics.Param param_physics = new DwPhysics.Param();
DwPhysics<DwParticle2D> physics;
ArrayList<DwSoftBody2D> softbodies;

int DISPLAY_MODE = 1;

boolean DISPLAY_PARTICLES      = true , DISPLAY_SPRINGS_STRUCT = true ,DISPLAY_SPRINGS_SHEAR  = true ,DISPLAY_SPRINGS_BEND   = true;

// first thing to do, inside draw()
boolean NEED_REBUILD = true;

DwSoftGrid2D lattice_girder = new DwSoftGrid2D();
DwSoftGrid2D chain          = new DwSoftGrid2D();
DwSoftBall2D circle         = new DwSoftBall2D();
DwSoftGrid2D box            = new DwSoftGrid2D();

public void settings() {
  size(viewport_w, viewport_h, P2D); 
  
}

public void setup() {
  // main library context
  DwPixelFlow context = new DwPixelFlow(this);
  context.print();
  //    context.printGL();

  physics = new DwPhysics<DwParticle2D>(param_physics);

  // global physics parameters
  param_physics.GRAVITY = new float[]{ 0, 0.2f };
  param_physics.bounds  = new float[]{ 0, 0, width, height };
  param_physics.iterations_collisions = 4;
  param_physics.iterations_springs    = 8;

  frameRate(60);
}

public void draw() {
  //println(chain.getNode( 0, 0));
  if (NEED_REBUILD) {
    initBodies();
    NEED_REBUILD = false;
  }

  updateMouseInteractions();    

  // update physics simulation
  physics.update(1);  
  // render
  background(DISPLAY_MODE == 0 ?  255 : 92);


  // 1) particles
  if (DISPLAY_PARTICLES) {
    for (DwSoftBody2D body : softbodies) {
      body.displayParticles(this.g);
    }
  }

  // interaction stuff
  if (DELETE_SPRINGS) {
    fill(255, 64);
    stroke(0);
    strokeWeight(1);
    ellipse(mouseX, mouseY, DELETE_RADIUS*2, DELETE_RADIUS*2);
  }
   
      
    DwParticle2D[] particles = physics.getParticles();
    particles[0].cx = mouseX;
    particles[picNum-1].cy = mouseY;
 
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
