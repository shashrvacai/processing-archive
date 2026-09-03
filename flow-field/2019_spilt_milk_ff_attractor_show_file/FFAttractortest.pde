
// OSC send
import oscP5.*;
OscP5 oscP5;
//Syphon
import codeanticode.syphon.*;

import java.util.Locale;

import com.jogamp.opengl.GL2;
import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.dwgl.DwGLSLProgram;
import com.thomasdiewald.pixelflow.java.dwgl.DwGLTexture;
import com.thomasdiewald.pixelflow.java.flowfieldparticles.DwFlowFieldParticles;
import com.thomasdiewald.pixelflow.java.imageprocessing.DwFlowField;
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.DwFilter;
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.Merge;
import com.thomasdiewald.pixelflow.java.utils.DwUtils;

import controlP5.Accordion;
import controlP5.CColor;
import controlP5.ControlP5;
import controlP5.Group;
import processing.core.*;
import processing.opengl.PGraphics2D;
import processing.opengl.PGraphicsOpenGL;

SyphonServer server;

boolean START_FULLSCREEN = !true;

float s1 =  4, s2 =  4, s3 =2, s4 =  5, s5 =  0.7, s6 =2, s7 =0, s8= 0, s9 = 0;  // ------------------------------- > sliders from MAX 
float s10 =  0, s12 =  0, s13 =0, s11 =  0, s14 =  0, s15 =  0, s16 =0, s17 =0 ;

int count = 0 ;
int viewport_w = 1680;
int viewport_h = 1024;

int gui_w = 200;
int gui_x = 30;
int gui_y = 30;

PGraphics2D pg_canvas;
PGraphics2D pg_obstacles;
PGraphics2D pg_impulse;
PGraphics2D pg_luminance;

DwPixelFlow context;

DwFlowFieldParticles particles;
DwFlowField ff_acc;
DwFlowField ff_impulse;
DwFlowField ff_attractors;

DwGLSLProgram shd_attractors;

public boolean UPDATE_PHYSICS  = true; 
public boolean AUTO_SPAWN      = true;
public boolean APPLY_BLOOM     = true;

float mul_attractors = 5f;

MouseObstacle[] mobs;

public void settings() {
  if (START_FULLSCREEN) {
    viewport_w = displayWidth;
    viewport_h = displayHeight;
    fullScreen(P2D);
  } else {
    viewport_w = (int) min(viewport_w, displayWidth  * 0.9f);
    viewport_h = (int) min(viewport_h, displayHeight * 0.9f);
    size(viewport_w, viewport_h, P2D);
  }
  smooth(0);
}

public void setup() {
  oscP5 = new OscP5(this, 9600);    
  server = new SyphonServer(this, "Nebula");      // syphon server  
  
  surface.setResizable(true);

  context = new DwPixelFlow(this);
  context.print();
  context.printGL();

  particles = new DwFlowFieldParticles(context, 1024 * 1024 * 4);

  ff_acc = new DwFlowField(context); 
  ff_impulse = new DwFlowField(context);
  ff_attractors = new DwFlowField(context);

  shd_attractors = context.createShader("data/attractors.frag");

  mobs = new MouseObstacle[2];
  mobs[0] = new MouseObstacle(0, 1*width/3f, 1*height/2f, 40);
  mobs[1] = new MouseObstacle(0, 2*width/3f, 1*height/2f, 40);

  resizeScene();
  frameRate(30);
}

public void draw() {
  server.sendScreen();
  count++ ;
  particles.param.timestep = 1/frameRate;
  resizeScene();
  updateScene();
  autoSpawnParticles();
  addImpulse();
  addAttractors();
  particleSimulation(); 
 
  particles.param.col_A = new float[]{0.5, 0.2, 0.7,0.2};
  //particles.param.col_B = new float[]{0.1, 0.8, 0.4,0.6};
  particles.param.col_B = new float[]{map(s7,0,127,0,1f), map(s8,0,127,0,1f), map(s9,0,127,0,1f), map(s10,0,127,0,1f)};

  // ------------------------------------------------------------- Starting Values

  particles.param.shader_collision_mult = 0.2f;
  particles.param.steps = 1;

  particles.param.size_display   =int(s1);
  particles.param.size_collision = int(s2);
  particles.param.size_cohesion  = int(s3);

  particles.param.mul_coh = s4;
  particles.param.mul_col = s5;
  particles.param.mul_obs = s6;

  particles.param.velocity_damping  = 1.00f;

  pg_canvas.beginDraw(); 
  pg_canvas.blendMode(REPLACE);
  pg_canvas.background(1);
  pg_canvas.blendMode(BLEND);   
  pg_canvas.image(pg_obstacles, 0, 0);
  pg_canvas.endDraw();
  particles.displayParticles(pg_canvas);

  if (APPLY_BLOOM) {
    DwFilter filter = DwFilter.get(context);
    filter.luminance_threshold.param.threshold = 0.0f; // when 0, all colors are used
    filter.luminance_threshold.param.exponent  = 5;
    filter.luminance_threshold.apply(pg_canvas, pg_luminance);

    filter.bloom.setBlurLayers(10);
    filter.bloom.gaussianpyramid.setBlurLayers(10);
    filter.bloom.param.blur_radius = 1;
    filter.bloom.param.mult   = 2;
    filter.bloom.param.radius = 0.01f;//map(mouseY, 0, height, 0, 1);
    filter.bloom.apply(pg_luminance, null, pg_canvas);
  }

  blendMode(REPLACE);
  image(pg_canvas, 0, 0);
  blendMode(BLEND);
}
