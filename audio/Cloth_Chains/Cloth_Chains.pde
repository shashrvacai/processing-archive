
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


//
// This examples creates 2 cloth-objects (softbodies).
// To compare them and checkout the different effect of parameters, both start 
// with the same particle/spring parameters, and the gui is used to alter them.
// 
// + Collision Detection
//
// Controls:
// LMB: drag particles
// MMB: drag + fix particles to a location
// RMB: disable springs, to rip the cloth
//
// + GUI
//

int viewport_w = 1280;
int viewport_h = 720;
int viewport_x = 230;
int viewport_y = 0;

int gui_w = 200;
int gui_x = viewport_w - gui_w;
int gui_y = 0;

// physics parameters
DwPhysics.Param param_physics = new DwPhysics.Param();

// particle parameters
DwParticle.Param param_particle_cloth1 = new DwParticle.Param();
DwParticle.Param param_particle_cloth2 = new DwParticle.Param();

// spring parameters
DwSpringConstraint.Param param_spring_cloth1 = new DwSpringConstraint.Param();
DwSpringConstraint.Param param_spring_cloth2 = new DwSpringConstraint.Param();

// physics simulation
DwPhysics<DwParticle2D> physics;

// cloth objects
DwSoftGrid2D cloth1 = new DwSoftGrid2D();
DwSoftGrid2D cloth2 = new DwSoftGrid2D();

// list, that wills store the cloths
ArrayList<DwSoftBody2D> softbodies = new ArrayList<DwSoftBody2D>();


PGraphics2D tex_cloth_left;



// 0 ... default: particles, spring
// 1 ... tension
int DISPLAY_MODE = 0;

// entities to display
boolean DISPLAY_PARTICLES      = true;
boolean DISPLAY_MESH           = !true;
boolean DISPLAY_SRPINGS        = true;

boolean DISPLAY_SPRINGS_STRUCT = true;
boolean DISPLAY_SPRINGS_SHEAR  = true;
boolean DISPLAY_SPRINGS_BEND   = true;

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
  param_physics.bounds  = new float[]{ 0, 0, viewport_w-gui_w, height };
  param_physics.iterations_collisions = 4;
  param_physics.iterations_springs    = 4;

  // particle parameters for Cloth1
  param_particle_cloth1.DAMP_BOUNDS    = 0.50000f;
  param_particle_cloth1.DAMP_COLLISION = 0.99999f;
  param_particle_cloth1.DAMP_VELOCITY  = 0.99100f; 

  // particle parameters for Cloth2
  param_particle_cloth2.DAMP_BOUNDS    = 0.50000f;
  param_particle_cloth2.DAMP_COLLISION = 0.99999f;
  param_particle_cloth2.DAMP_VELOCITY  = 0.99100f; 

  // spring parameters for Cloth1
  param_spring_cloth1.damp_dec = 0.999999f;
  param_spring_cloth1.damp_inc = 0.000199f;

  // spring parameters for Cloth2  
  param_spring_cloth2.damp_dec = 0.999999f;
  param_spring_cloth2.damp_inc = 0.000199f;

  // initial cloth building parameters, both cloth start the same
  cloth1.CREATE_STRUCT_SPRINGS = true;
  cloth1.CREATE_SHEAR_SPRINGS  = true;
  cloth1.CREATE_BEND_SPRINGS   = true;
  cloth1.bend_spring_mode      = 0;
  cloth1.bend_spring_dist      = 3;

  cloth2.CREATE_STRUCT_SPRINGS = true;
  cloth2.CREATE_SHEAR_SPRINGS  = true;
  cloth2.CREATE_BEND_SPRINGS   = true;
  cloth2.bend_spring_mode      = 0;
  cloth2.bend_spring_dist      = 3;

  createBodies();

  createGUI();

  frameRate(60);
}

public void createTexture(String text, DwSoftGrid2D cloth) {

  int nodex_x = cloth.nodes_x;
  int nodes_y = cloth.nodes_y;
  float nodes_r = cloth.nodes_r;

  int tex_w = Math.round((nodex_x-1) *nodes_r*2);
  int tex_h = Math.round((nodes_y-1) *nodes_r*2);

  PFont font = createFont("Calibri", 64);

  PGraphics2D texture = cloth.texture_XYp;

  if (texture == null) {
    texture = (PGraphics2D) createGraphics(tex_w, tex_h, P2D);
    texture.smooth(8);
  }


  cloth.texture_XYp = texture;
}



public void createBodies() {

  physics.reset();  
  softbodies.clear();   

  softbodies.add(cloth1);    
  cloth1.setParticleColor(color(255, 180, 0, 128));    
  cloth1.setMaterialColor(color(155, 180, 0, 128));    
  cloth1.setParam(param_particle_cloth1);    
  cloth1.setParam(param_spring_cloth1);

  // both cloth are of the same size
  int nodes_x = 100;
    int nodes_r = 5;
  int nodes_y = 50;

  int nodes_start_x = 0;
  int nodes_start_y = 0;

  int   num_cloth = softbodies.size();
  float cloth_width = 2 * nodes_r * (nodes_x-1);
  float spacing = ((viewport_w - gui_w) - num_cloth * cloth_width) / (float)(num_cloth+1);  

  // create all cloth in the list
  for (int i = 0; i < num_cloth; i++) {
    nodes_start_x += spacing + cloth_width * i;
    //      if(i == 1){
    //        nodes_x = 5;
    //        nodes_y = 5;
    //      }
    DwSoftGrid2D cloth = (DwSoftGrid2D) softbodies.get(i);
    cloth.create(physics, nodes_x, nodes_y, nodes_r, nodes_start_x, nodes_start_y);
    for (int j = 0; j <cloth.nodes_x-1; j++) {
      cloth.getNode( j, 0).enable(false, false, false); // fix node to current location

      cloth.createShapeParticles(this);
    }
  }
}
public void draw() {


  updateMouseInteractions();

  // update physics simulation
  physics.update(1);

  // render
  pushMatrix();
  fill(255,75);
  rect(0,0,width,height);
  popMatrix();
  
  
  
  



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


  // info
  int NUM_SPRINGS   = physics.getSpringCount();
  int NUM_PARTICLES = physics.getParticlesCount();
  String txt_fps = String.format(getClass().getName()+ "   [particles %d]   [springs %d]   [frame %d]   [fps %6.2f]", NUM_PARTICLES, NUM_SPRINGS, frameCount, frameRate);
  surface.setTitle(txt_fps);

  //  DwParticle2D[] particles = physics.getParticles();           // move stuff around 
  //  particles[0].cx = mouseX;
  //  particles[0].cy = mouseY;
}

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
  if (cp5.isMouseOver()) return; 

  // deleting springs/constraints between particles
  if (DELETE_SPRINGS) {
    ArrayList<DwParticle> list = findParticlesWithinRadius(mouseX, mouseY, DELETE_RADIUS);
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
float   DELETE_RADIUS = 20;

public void mousePressed() {
  boolean mouseInteraction = !cp5.isMouseOver();
  if (mouseInteraction) {
    if (mouseButton == RIGHT ) DELETE_SPRINGS = true; 
    if (!DELETE_SPRINGS) {
      particle_mouse = findNearestParticle(mouseX, mouseY, 100);
      if (particle_mouse != null) particle_mouse.enable(false, false, false);
    }
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















//////////////////////////////////////////////////////////////////////////////
// GUI STUFF
//////////////////////////////////////////////////////////////////////////////


public void cloth1_CREATE_SPRING_TYPE  (float[] val) {
  cloth1.CREATE_STRUCT_SPRINGS = (val[0] > 0);
  cloth1.CREATE_SHEAR_SPRINGS  = (val[1] > 0);
  cloth1.CREATE_BEND_SPRINGS   = (val[2] > 0);
  NEED_REBUILD = true;
}
public void cloth1_BEND_SPRING_MODE(int val) {
  cloth1.bend_spring_mode = val;
  NEED_REBUILD = true;
}
public void cloth1_BEND_SPRING_LEN(int val) {
  cloth1.bend_spring_dist = val;
  NEED_REBUILD = true;
}


public void cloth2_CREATE_SPRING_TYPE  (float[] val) {
  cloth2.CREATE_STRUCT_SPRINGS = (val[0] > 0);
  cloth2.CREATE_SHEAR_SPRINGS  = (val[1] > 0);
  cloth2.CREATE_BEND_SPRINGS   = (val[2] > 0);
  NEED_REBUILD = true;
}
public void cloth2_BEND_SPRING_MODE(int val) {
  cloth2.bend_spring_mode = val;
  NEED_REBUILD = true;
}
public void cloth2_BEND_SPRING_LEN(int val) {
  cloth2.bend_spring_dist = val;
  NEED_REBUILD = true;
}




public void setDisplayMode(int val) {
  DISPLAY_MODE = val;
}

//  public void setDisplayTypes(float[] val){
//    DISPLAY_PARTICLES      = (val[0] > 0);
//    DISPLAY_SPRINGS_STRUCT = (val[1] > 0);
//    DISPLAY_SPRINGS_SHEAR  = (val[2] > 0);
//    DISPLAY_SPRINGS_BEND   = (val[3] > 0); 
//  }

public void setDisplayTypes(float[] val) {
  DISPLAY_PARTICLES = (val[0] > 0);
  DISPLAY_MESH      = (val[1] > 0);
  DISPLAY_SRPINGS   = (val[2] > 0);
}

public void setGravity(float val) {
  physics.param.GRAVITY[1] = val;
}





ControlP5 cp5;

public void createGUI() {
  cp5 = new ControlP5(this);

  int sx, sy, px, py, oy;
  sx = 100; 
  sy = 14; 
  oy = (int)(sy*1.4f);

  ////////////////////////////////////////////////////////////////////////////
  // GUI - CLOTH1
  ////////////////////////////////////////////////////////////////////////////
  Group group_physics = cp5.addGroup("global");
  {
    group_physics.setHeight(20).setSize(gui_w, height)
      .setBackgroundColor(color(16, 220)).setColorBackground(color(16, 220));
    group_physics.getCaptionLabel().align(CENTER, CENTER);

    px = 10; 
    py = 15;

    int bsx = (gui_w-40)/3;
    cp5.addButton("rebuild").setGroup(group_physics).plugTo(this, "createBodies"           ).setSize(bsx, 18).setPosition(px, py);
    cp5.addButton("repair" ).setGroup(group_physics).plugTo(this, "repairAllSprings"       ).setSize(bsx, 18).setPosition(px+=bsx+10, py);
    cp5.addButton("memory" ).setGroup(group_physics).plugTo(this, "applySpringMemoryEffect").setSize(bsx, 18).setPosition(px+=bsx+10, py);

    px = 10; 
    cp5.addSlider("gravity").setGroup(group_physics).setSize(sx, sy).setPosition(px, py+=(int)(oy*1.5f))
      .setRange(0.1, 5).setValue(physics.param.GRAVITY[1]).plugTo(this, "setGravity");

    cp5.addSlider("iter: springs").setGroup(group_physics).setSize(sx, sy).setPosition(px, py+=oy)
      .setRange(0, 50).setValue(physics.param.iterations_springs).plugTo( physics.param, "iterations_springs");

    cp5.addSlider("iter: collisions").setGroup(group_physics).setSize(sx, sy).setPosition(px, py+=oy)
      .setRange(0, 10).setValue(physics.param.iterations_collisions).plugTo( physics.param, "iterations_collisions");

    cp5.addRadio("setDisplayMode").setGroup(group_physics).setSize(sy, sy).setPosition(px, py+=(int)(oy*1.4f))
      .setSpacingColumn(2).setSpacingRow(2).setItemsPerRow(1)
      .addItem("colored", 0)
      .addItem("tension", 1)
      .activate(DISPLAY_MODE);


  }



  ////////////////////////////////////////////////////////////////////////////
  // GUI - CLOTH1
  ////////////////////////////////////////////////////////////////////////////
  Group group_cloth1 = cp5.addGroup("cloth 1");
  {
    Group group_cloth = group_cloth1;

    group_cloth.setHeight(20).setSize(gui_w, 210)
      .setBackgroundColor(color(16, 220)).setColorBackground(color(16, 220));
    group_cloth.getCaptionLabel().align(CENTER, CENTER);

    px = 10; 
    py = 15;

    cp5.addSlider("C1.velocity").setGroup(group_cloth).setSize(sx, sy).setPosition(px, py)
      .setRange(0.5, 1.5).setValue(param_particle_cloth1.DAMP_VELOCITY).plugTo(param_particle_cloth1, "DAMP_VELOCITY");

    cp5.addSlider("C1.contraction").setGroup(group_cloth).setSize(sx, sy).setPosition(px, py+=oy)
      .setRange(0.1, 0.001).setValue(param_spring_cloth1.damp_dec).plugTo(param_spring_cloth1, "damp_dec");

    cp5.addSlider("C1.expansion").setGroup(group_cloth).setSize(sx, sy).setPosition(px, py+=oy)
      .setRange(0, 1).setValue(param_spring_cloth1.damp_inc).plugTo(param_spring_cloth1, "damp_inc");

    cp5.addCheckBox("cloth1_CREATE_SPRING_TYPE").setGroup(group_cloth).setSize(sy, sy).setPosition(px, py+=oy)
      .setSpacingColumn(2).setSpacingRow(2).setItemsPerRow(1)
      .addItem("C1.struct springs", 0).activate(cloth1.CREATE_STRUCT_SPRINGS ? 0 : 2)
      .addItem("C1.shear springs", 1).activate(cloth1.CREATE_SHEAR_SPRINGS  ? 1 : 2)
      .addItem("C1.bend springs", 2).activate(cloth1.CREATE_BEND_SPRINGS   ? 2 : 2)
      ;

    cp5.addRadio("cloth1_BEND_SPRING_MODE").setGroup(group_cloth).setSize(sy, sy).setPosition(px, py+=oy*3)
      .setSpacingColumn(2).setSpacingRow(2).setItemsPerRow(1)
      .addItem("C1.bend springs: diagonal", 0)
      .addItem("C1.bend springs: ortho", 1)
      .addItem("C1.bend springs: random", 2)
      .activate(cloth1.bend_spring_mode);

    cp5.addSlider("C1.bend spring len").setGroup(group_cloth).setSize(sx, sy).setPosition(px, py+=oy*3)
      .setRange(0, 50).setValue(cloth1.bend_spring_dist).plugTo(this, "cloth1_BEND_SPRING_LEN");
  }


  ////////////////////////////////////////////////////////////////////////////
  // GUI - ACCORDION
  ////////////////////////////////////////////////////////////////////////////
  cp5.addAccordion("acc").setPosition(gui_x, gui_y).setWidth(gui_w).setSize(gui_w, height)
    .setCollapseMode(Accordion.MULTI)
    .addItem(group_cloth1)
    .addItem(group_physics)
    .open(0, 1, 2);
}
