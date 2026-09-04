
import oscP5.*;
import netP5.*;

OscP5 oscUniRec;
NetAddress UniCloth;

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


int viewport_x = 230;
int viewport_y = 0;
int rec = 0;

// physics parameters
DwPhysics.Param param_physics = new DwPhysics.Param();

DwParticle.Param param_particle_cloth = new DwParticle.Param();
// spring parameters
DwSpringConstraint.Param param_spring_cloth = new DwSpringConstraint.Param();
// physics simulation
DwPhysics<DwParticle2D> physics;
DwSoftGrid2D cloth0= new DwSoftGrid2D();
DwSoftGrid2D cloth1 = new DwSoftGrid2D();
DwSoftGrid2D cloth2 = new DwSoftGrid2D();
DwSoftGrid2D cloth3 = new DwSoftGrid2D();
DwSoftGrid2D cloth4 = new DwSoftGrid2D();

// list, that wills store the cloths
ArrayList<DwSoftBody2D> softbodies = new ArrayList<DwSoftBody2D>();


// 0 ... default: particles, spring
// 1 ... tension
int DISPLAY_MODE = 0;
float a = 0, b = 0, gr = 0, ga = 0, gb =0 ;
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


void oscEvent(OscMessage theOscMessage) {    
  rec= theOscMessage.get(0).intValue(); 
  // print out the message
  println(rec);
}
public void setup() {
  size(1080, 1220, P2D); 
  smooth(8);

  oscUniRec = new OscP5(this, 5001);
  UniCloth = new NetAddress("127.0.0.1", 6001);
  surface.setLocation(viewport_x, viewport_y);

  // main library context
  DwPixelFlow context = new DwPixelFlow(this);

  physics = new DwPhysics<DwParticle2D>(param_physics);

  ///
  param_physics.bounds  = new float[]{ 0, 0, width, height };
  param_physics.iterations_collisions = 4;
  param_physics.iterations_springs    = 4;

  // particle parameters for Cloth1
  param_particle_cloth.DAMP_BOUNDS    = 0.90000f;
  param_particle_cloth.DAMP_COLLISION = 0.99999f;
  param_particle_cloth.DAMP_VELOCITY  = 0.99100f; 

  // spring parameters for Cloth1
  param_spring_cloth.damp_dec = 0.999999f;
  param_spring_cloth.damp_inc = 0.001199f;

  cloth0.CREATE_STRUCT_SPRINGS = true;
  cloth0.CREATE_SHEAR_SPRINGS  = true;
  cloth0.CREATE_BEND_SPRINGS   = true;
  cloth0.bend_spring_mode      = 7;
  //cloth0.bend_spring_dist      = 500;

  cloth1.CREATE_STRUCT_SPRINGS = true;
  cloth1.CREATE_SHEAR_SPRINGS  = true;
  cloth1.CREATE_BEND_SPRINGS   = true;
  cloth1.bend_spring_mode      = 0;
  cloth1.bend_spring_dist      = 6;

  cloth2.CREATE_STRUCT_SPRINGS = true;
  cloth2.CREATE_SHEAR_SPRINGS  = true;
  cloth2.CREATE_BEND_SPRINGS   = true;
  cloth2.bend_spring_mode      = 0;
  cloth2.bend_spring_dist      = 8;

  cloth3.CREATE_STRUCT_SPRINGS = true;
  cloth3.CREATE_SHEAR_SPRINGS  = true;
  cloth3.CREATE_BEND_SPRINGS   = true;
  cloth3.bend_spring_mode      = 0;
  cloth3.bend_spring_dist      =7;

  cloth4.CREATE_STRUCT_SPRINGS = true;
  cloth4.CREATE_SHEAR_SPRINGS  = true;
  cloth4.CREATE_BEND_SPRINGS   = true;
  cloth4.bend_spring_mode      = 0;
  cloth4.bend_spring_dist      = 5;


  createBodies();
  frameRate(60);
}

public void draw() {
  println(rec);               // the value to a lower num 
  float addSpeed = map(rec, 0, 10000000, 0, 0.1);

  ga = map(sin(gr), -1, 1, -0.4, 0.4);
  gb = map(cos(gr), 1, -1, -0.2, 0.2);


  gr += map(rec, 0, 10000000, 0.000001, 0.01);

  param_physics.GRAVITY = new float[]{ gb, ga };      /// gravity 


  pushMatrix();
  fill(255, 10);
  rect(0, 0, width, height);

  popMatrix();

  if (NEED_REBUILD) {
    createBodies();
    NEED_REBUILD = false;
  }
  updateMouseInteractions();
  // update physics simulation
  physics.update(1);
  // render

  cloth0.setMaterialColor(color(  255, 255, 255, 0));
  cloth0.createShapeMesh(this.g);
  cloth0.shade_springs_by_tension = (DISPLAY_MODE == 1);
  cloth0.getNode(0, 0).cx = width/2-150;
  cloth0.getNode(0, 0).cy = 0;
  cloth0.getNode(cloth0.nodes_x-1, 0).cx = width/2+150;
  cloth0.getNode(cloth0.nodes_x-1, 0).cy = 0;
  cloth0.getNode(0, cloth0.nodes_y-1).cx = width/2-150;
  cloth0.getNode(0, cloth0.nodes_y-1).cy = height-100;
  cloth0.getNode(cloth0.nodes_x-1, cloth0.nodes_y-1).cx = width/2+150;
  cloth0.getNode(cloth0.nodes_x-1, cloth0.nodes_y-1).cy = height-100;

  //curtain1
  cloth1.createShapeMesh(this.g);
  cloth1.displayMesh(this.g);
  cloth1.shade_springs_by_tension = (DISPLAY_MODE == 1);
  //cloth1.displaySprings(this.g, new DwStrokeStyle(color(205, 90, 30, 10), 1f), DwSpringConstraint.TYPE.BEND);
  cloth1.displaySprings(this.g, new DwStrokeStyle(color( 0, map(sin(-gr), -1, 1, 0, 255), 0), 1), DwSpringConstraint.TYPE.SHEAR);
  //cloth1.displaySprings(this.g, new DwStrokeStyle(color(  0, 0, 0), 0.2f), DwSpringConstraint.TYPE.STRUCT);

  cloth1.setMaterialColor(color(  map(sin(gr), -1, 1, 0, 255), 200, 255, 120));

  float C1x= sin(a)*150 + width/4-100;
  float C1x1= -sin(1.1*a)*150+width/4-100;
  float C1y= -cos(b)*(height/4-200) + height/2+height/4;
  float C1y1= cos(b)*(height/4-200) + height/2+height/4;

  cloth1.getNode(0, 0).cx = C1x;
  cloth1.getNode(0, 0).cy = C1y;
  cloth1.getNode(cloth1.nodes_x-1, cloth1.nodes_y-1).cx = C1x1;
  cloth1.getNode(cloth1.nodes_x-1, cloth1.nodes_y-1).cy = C1y1;

  //curtain2
  cloth2.createShapeMesh(this.g);
  cloth2.displayMesh(this.g);
  cloth2.shade_springs_by_tension = (DISPLAY_MODE == 1);
  // cloth2.displaySprings(this.g, new DwStrokeStyle(color( 255, 255, 255), 2), DwSpringConstraint.TYPE.SHEAR);
  cloth2.displaySprings(this.g, new DwStrokeStyle(color( map(sin(gr), -1, 1, 0, 255), 0, 10), 0.8f), DwSpringConstraint.TYPE.STRUCT);
  cloth2.setMaterialColor(color(map(sin(gr), -1, 1, 0, 255), 58, 255, 8));

  float C2x= sin(a)*150 + (width-width/4+100);
  float C2x1= sin(1.2*a)*150+(width-width/4+100);
  float C2y= cos(b)*(height/4-200) + height/4;
  float C2y1= -cos(b)*(height/4-200) +height/4;
  cloth2.getNode(0, 0).cx = C2x;
  cloth2.getNode(0, 0).cy = C2y;
  cloth2.getNode(cloth2.nodes_x-1, cloth2.nodes_y-1).cx = C2x1;
  cloth2.getNode(cloth2.nodes_x-1, cloth2.nodes_y-1).cy = C2y1;

  //curtain3
  cloth3.createShapeMesh(this.g);
  cloth3.displayMesh(this.g);
  cloth3.shade_springs_by_tension = (DISPLAY_MODE == 1);
  //cloth3.displaySprings(this.g, new DwStrokeStyle(color(205, map(sin(gr), -1, 1, 0, 255), 30, 100), 2f), DwSpringConstraint.TYPE.BEND);
  // cloth3.displaySprings(this.g, new DwStrokeStyle(color( 255, 255, 255), 2), DwSpringConstraint.TYPE.SHEAR);
  cloth3.displaySprings(this.g, new DwStrokeStyle(color(map(sin(gr), -1, 1, 0, 255) , 0, 0), 0.2f), DwSpringConstraint.TYPE.STRUCT);

  cloth3.setMaterialColor(color(  10, 200, 255, 18));

  float C3x= sin(a)*150 + (width/4);
  float C3x1= -sin(1.4*a)*150+(width/4);
  float C3y= cos(b)*(height/4-200) + height/4;
  float C3y1= -cos(b)*(height/4-200) + height/4;

  cloth3.getNode(0, 0).cx = C3x;
  cloth3.getNode(0, 0).cy = C3y;
  cloth3.getNode(cloth3.nodes_x-1, cloth3.nodes_y-1).cx = C3x1;
  cloth3.getNode(cloth3.nodes_x-1, cloth3.nodes_y-1).cy = C3y1;

  //curtain4
  cloth4.createShapeMesh(this.g);
  cloth4.displayMesh(this.g);
  cloth4.shade_springs_by_tension = (DISPLAY_MODE == 1);
  cloth4.displaySprings(this.g, new DwStrokeStyle(color(205, map(sin(gr), -1, 1, 255, 0), 30, 100), 1f), DwSpringConstraint.TYPE.BEND);
  // cloth4.displaySprings(this.g, new DwStrokeStyle(color( 255, 255, 255), 2), DwSpringConstraint.TYPE.SHEAR);
  // cloth4.displaySprings(this.g, new DwStrokeStyle(color(  0, 0, 0), 0.2f), DwSpringConstraint.TYPE.STRUCT);
  float C4x= sin(a)*200 + (width-width/4+100);
  float C4x1= sin(1.5*a)*200+(width-width/4+100);
  float C4y= -cos(b)*(height/4-200) +height/2+height/4;
  float C4y1= cos(b)*(height/4-200) +height/2+height/4;

  cloth4.getNode(0, 0).cx = C4x;
  cloth4.getNode(0, 0).cy = C4y;
  cloth4.getNode(cloth4.nodes_x-1, cloth1.nodes_y-1).cx = C4x1;
  cloth4.getNode(cloth4.nodes_x-1, cloth1.nodes_y-1).cy = C4y1;



  b += addSpeed/16 ; 
  a+=addSpeed/4 ;
}
