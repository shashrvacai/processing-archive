// with syphon to max ..   
// added sliders 

// with oscp5 connections

import oscP5.*;
OscP5 oscP5;

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
PVector pos, nOff ;

boolean START_FULLSCREEN = !true;

float s1 =  0, s2 =  0, s3 =0, s4 =  0, s5 =  0, s6 =0, s7 =0 , s8= 0 ,s9 = 0;  // ------------------------------- > sliders from MAX 
float s10 =  0, s12 =  0, s13 =0, s11 =  0, s14 =  0, s15 =  0, s16 =0, s17 =0 ;

int viewport_w = 1680;
int viewport_h = 1024;
int viewport_x = 0;
int viewport_y = 0;

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
public boolean DISPLAY_FLOW    = !true;  
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
  oscP5 = new OscP5(this, 12000);    
  server = new SyphonServer(this, "Processing Syphon");      // syphon server

  surface.setResizable(true);

  context = new DwPixelFlow(this);
  context.print();
  context.printGL();

  particles = new DwFlowFieldParticles(context, 1024 * 1024 * 4);

  pos = new PVector(width/2, height/2);                         // random emittor
  nOff = new PVector(random(10000), random(1000));       

  ff_acc = new DwFlowField(context); 
  ff_impulse = new DwFlowField(context);
  ff_attractors = new DwFlowField(context);

  shd_attractors = context.createShader("data/attractors.frag");

  mobs = new MouseObstacle[2];
  mobs[0] = new MouseObstacle(0, width, 1*height/2f, 20);
  mobs[1] = new MouseObstacle(0, 2*width/3f, 1*height/2f, 20);

  resizeScene();

  // createGUI();                 //  ------------ GUI Debugger 

  frameRate(100);
}


// dynamically resize if surface-size changes
public boolean resizeScene() {

  boolean[] RESIZED = { false };
  pg_canvas     = DwUtils.changeTextureSize(this, pg_canvas, width, height, 0, RESIZED);
  pg_obstacles  = DwUtils.changeTextureSize(this, pg_obstacles, width, height, 0, RESIZED);
  pg_impulse    = DwUtils.changeTextureSize(this, pg_impulse, width, height, 0, RESIZED);
  pg_luminance  = DwUtils.changeTextureSize(this, pg_luminance, width, height, 0, RESIZED);

  if (RESIZED[0]) {
    setParticleColor(2);
  }
  return RESIZED[0];
}

//////////////////////////////////////////////////////////////////////////////
//
// DRAW
//
//////////////////////////////////////////////////////////////////////////////

float impulse_max = 256;
float impulse_mul = 15;
float impulse_tsmooth = 0.90f;
int   impulse_blur  = 0;

public void draw() {

  particles.param.timestep = 1/frameRate;

  resizeScene();

  updateScene();

  SpawnParticles();

  addImpulse();

  addAttractors();

  particleSimulation();

  //println(s2);
  particles.param.col_A = new float[]{map(s10,0,127,0,1f), map(s11,0,127,0,1f), map(s12,0,127,0,1f), map(s13,0,127,0,1f)};
  particles.param.col_B = new float[]{map(s14,0,127,0,1f), map(s15,0,127,0,1f), map(s16,0,127,0,1f), map(s17,0,127,0,1f)};

  // ------------------------------------------------------starting values

  particles.param.shader_collision_mult = 0.2f;                               // do not change
  particles.param.steps = 1; 

  particles.param.size_display   = int(map(s1, 0, 127,1, 20));
  particles.param.size_collision = 5 ;//int(map(s2, 0, 127, 1, 20));
  particles.param.size_cohesion  = 5 ;//nt(map(s3, 0, 127, 1, 20));

  particles.param.mul_col = 5 ;//(map(s4, 0, 127, 0.00, 8));
  particles.param.mul_coh = 5 ; //(map(s5, 0, 127, 0.00, 8));
  particles.param.mul_obs = 0.1;//(map(s6, 0, 127, 0.00, 8));

  particles.param.velocity_damping  = (map(s7, 0, 127, 0.95, 1));


    pg_canvas.beginDraw(); 
    pg_canvas.blendMode(REPLACE);
    pg_canvas.background(1);
    pg_canvas.blendMode(BLEND);   
    pg_canvas.image(pg_obstacles, 0, 0);
    pg_canvas.endDraw();
    particles.displayParticles(pg_canvas);

  if (APPLY_BLOOM) {
    DwFilter filter = DwFilter.get(context);
    filter.luminance_threshold.param.threshold = 0f; // when 0, all colors are used
    filter.luminance_threshold.param.exponent  = 5;
    filter.luminance_threshold.apply(pg_canvas, pg_luminance);

    filter.bloom.setBlurLayers(10);
    //      filter.bloom.gaussianpyramid.setBlurLayers(10);
    filter.bloom.param.blur_radius = 1;
    filter.bloom.param.mult   = map(s8, 0, 127, 0, 5); 
    filter.bloom.param.radius = map(s9, 0, 127, 0, 1);
    filter.bloom.apply(pg_luminance, null, pg_canvas);
  }

  blendMode(REPLACE);
  image(pg_canvas, 0, 0);
  blendMode(BLEND);
}

//////////////////////////////////////////////////////////////////////////////
//
// SCENE
//
//////////////////////////////////////////////////////////////////////////////


int[] BG      = { 0, 0, 0, 0};
int[] FG      = {0, 0, 0, 255};
int[] FG_MOBS = {0, 0, 255, 255};
void setFill(PGraphicsOpenGL pg, int[] rgba) {
  pg.fill(0,0,155,23);
}

void updateScene() {
  int w = pg_obstacles.width;
  int h = pg_obstacles.height;

  pg_obstacles.beginDraw();
  pg_obstacles.clear();
  pg_obstacles.noStroke();
  pg_obstacles.blendMode(REPLACE);
  pg_obstacles.rectMode(CORNER);
  setFill(pg_obstacles, FG);
  pg_obstacles.rect(0, 0, w, h);
  setFill(pg_obstacles, BG);
  pg_obstacles.rect(10, 10, w-20, h-20);
  pg_obstacles.blendMode(BLEND);
  for (int i = 0; i < mobs.length; i++) {
    //mobs[i].draw(pg_obstacles, FG_MOBS);
  }
  pg_obstacles.endDraw();
  server.sendImage(pg_canvas);
}


public void SpawnParticles() {    
  if (AUTO_SPAWN && (frameCount%6) == 0) {
    pos.x = map(noise(nOff.x), 0, 1, 0, width);
    pos.y = map(noise(nOff.y), 0, 1, 0, height);
    nOff.add(0.01, 0.01, 0);

    float px = pos.x;
    float py = pos.y;


    // -------------------- autoSpawner
    DwFlowFieldParticles.SpawnRadial sr = new DwFlowFieldParticles.SpawnRadial();
    sr.num(1);
    sr.dim(10, 10);
    sr.pos(px, height-1 - py);
    sr.vel(0, 0);
    particles.spawn(width, height, sr);

    //      px = width-100;
    //      py = 100;
    //      sr.pos(px, height-1 - py);
    //      particles.spawn(width, height, sr);
  }

  if ( mousePressed) {          
    if (mouseButton == LEFT) {
      int count = ceil(particles.getCount() * 0.01f);
      count = min(max(count, 1), 5000);  
      int radius = ceil(sqrt(count));
      spawn(radius, count);
    }
  }
}

void oscEvent(OscMessage theOscMessage) {       /// osc message to MAX
  float v1 = theOscMessage.get(0).floatValue(); 
  float v2 = theOscMessage.get(0).floatValue(); 
  float v3 = theOscMessage.get(0).floatValue(); 
  float v4 = theOscMessage.get(0).floatValue(); 
  float v5 = theOscMessage.get(0).floatValue(); 
  float v6 = theOscMessage.get(0).floatValue(); 
  float v7 = theOscMessage.get(0).floatValue(); 
  float v8 = theOscMessage.get(0).floatValue(); 
  float v9 = theOscMessage.get(0).floatValue(); 
  float v10 = theOscMessage.get(0).floatValue();  
  float v11 = theOscMessage.get(0).floatValue(); 
  float v12 = theOscMessage.get(0).floatValue(); 
  float v13 = theOscMessage.get(0).floatValue(); 
  float v14 = theOscMessage.get(0).floatValue(); 
  float v15 = theOscMessage.get(0).floatValue(); 
  float v16 = theOscMessage.get(0).floatValue(); 
  float v17 = theOscMessage.get(0).floatValue(); 

  if (theOscMessage.checkAddrPattern("/s1")) {   //  message reciever      
    s1 = v1;
  } else if (theOscMessage.checkAddrPattern("/s2")) {   //  message reciever      
    s2 = v2;
  } else if (theOscMessage.checkAddrPattern("/s3")) {   //  message reciever      
    s3 = v3;
  } else if (theOscMessage.checkAddrPattern("/s4")) {   //  message reciever      
    s4 = v4;
  } else if (theOscMessage.checkAddrPattern("/s5")) {   //  message reciever      
    s5 = v5;
  } else if (theOscMessage.checkAddrPattern("/s6")) {   //  message reciever      
    s6 = v6;
  } else if (theOscMessage.checkAddrPattern("/s7")) {   //  message reciever      
    s7 = v7;
  }  else if (theOscMessage.checkAddrPattern("/s8")) {   //  message reciever      
    s8 = v8;
  }else if (theOscMessage.checkAddrPattern("/s9")) {   //  message reciever      
    s9 = v9;
  }else if (theOscMessage.checkAddrPattern("/s10")) {   //  message reciever      
    s10 = v10;
  } else if (theOscMessage.checkAddrPattern("/s12")) {   //  message reciever      
    s12 = v12;
  } else if (theOscMessage.checkAddrPattern("/s13")) {   //  message reciever      
    s13 = v13;
  }if (theOscMessage.checkAddrPattern("/s11")) {   //  message reciever      
    s11 = v11;
  } else if (theOscMessage.checkAddrPattern("/s14")) {   //  message reciever      
    s14 = v14;
  } else if (theOscMessage.checkAddrPattern("/s15")) {   //  message reciever      
    s15 = v15;
  } else if (theOscMessage.checkAddrPattern("/s16")) {   //  message reciever      
    s16 = v16;
  } else if (theOscMessage.checkAddrPattern("/s17")) {   //  message reciever      
    s17 = v17;
  }
} 
