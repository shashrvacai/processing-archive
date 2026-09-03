
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
import processing.core.*;
import processing.opengl.PGraphics2D;
import processing.opengl.PGraphicsOpenGL;
import spout.*;

// OSC send
import oscP5.*;
OscP5 oscP5;

Spout spout;

int viewport_w = 786;
int viewport_h = 1380;

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
public boolean DISPLAY_DIST    = !true; 
public boolean AUTO_SPAWN      = true;
public boolean APPLY_BLOOM     = true;

float mul_attractors = 5f;

MouseObstacle[] mobs;

float aP1 =  4, aP2 =  4, aP3 =2, aP4 =  5, aP5 =  0.7, aP6 =2, aP7 =0, aP8= 0, aP9 = 0;  // ------ > sliders from MAX 

public void settings() {
  viewport_w = (int) min(viewport_w, displayWidth  * 0.9f);
  viewport_h = (int) min(viewport_h, displayHeight * 0.9f);
  size(viewport_w, viewport_h, P2D);
  smooth(0);
}

public void setup() {

  // --------------------------------- OSc connection
  oscP5 = new OscP5(this, 9600); 

  spout = new Spout(this);   ////  ----  Spout
  spout.createSender("FFatractor");


  surface.setResizable(true);
  frameRate(500);
  context = new DwPixelFlow(this);
  particles = new DwFlowFieldParticles(context, 1024 * 1024 * 4);

  ff_acc = new DwFlowField(context); 
  ff_impulse = new DwFlowField(context);
  ff_attractors = new DwFlowField(context);

  shd_attractors = context.createShader("data/attractors.frag");

  mobs = new MouseObstacle[2];    
  resizeScene();
}
// dynamically resize if surface-size changes
public boolean resizeScene() {

  boolean[] RESIZED = { false };
  pg_canvas     = DwUtils.changeTextureSize(this, pg_canvas, width, height, 0, RESIZED);
  pg_obstacles  = DwUtils.changeTextureSize(this, pg_obstacles, width, height, 0, RESIZED);
  pg_impulse    = DwUtils.changeTextureSize(this, pg_impulse, width, height, 0, RESIZED);
  pg_luminance  = DwUtils.changeTextureSize(this, pg_luminance, width, height, 0, RESIZED);


  return RESIZED[0];
}

public void draw() {
  spout.sendTexture();


  particles.param.col_A = new float[]{4.0f, 0.60f, 0.80f, 3};
  particles.param.col_B = new float[]{2.30f, 3.30f, 0.95f, 1};

  particles.param.velocity_damping  = 0.99f;
  particles.param.steps = 1;
  particles.param.shader_collision_mult = 0.2f;

  particles.param.size_display   = 8;
  particles.param.size_collision = 8;
  particles.param.size_cohesion  = 2;

  particles.param.mul_coh = 5.00f;
  particles.param.mul_col = 0.70f;
  particles.param.mul_obs = 2.00f;


  particles.param.timestep = 1/frameRate;  
  resizeScene();    
  updateScene();   
  autoSpawnParticles();
  addImpulse();    
  addAttractors();    
  particleSimulation();


  pg_canvas.beginDraw(); 
  pg_canvas.blendMode(REPLACE);
  pg_canvas.background(1);
  pg_canvas.blendMode(BLEND);   
  pg_canvas.image(pg_obstacles, 0, 0);
  pg_canvas.endDraw();
  particles.displayParticles(pg_canvas);

  DwFilter filter = DwFilter.get(context);
  filter.luminance_threshold.param.threshold = 0.3f; // when 0, all colors are used
  filter.luminance_threshold.param.exponent  = 5;
  filter.luminance_threshold.apply(pg_canvas, pg_luminance);

  filter.bloom.setBlurLayers(10);
  filter.bloom.gaussianpyramid.setBlurLayers(10);
  filter.bloom.param.blur_radius = 1;
  filter.bloom.param.mult   = 1.2f;    //map(mouseX, 0, width, 0, 10);
  filter.bloom.param.radius = 0.1f;//map(mouseY, 0, height, 0, 1);
  filter.bloom.apply(pg_luminance, null, pg_canvas);


  blendMode(REPLACE);
  image(pg_canvas, 0, 0);
  blendMode(BLEND);
}



int[] BG      = { 0, 0, 0, 0};
int[] FG      = {16, 16, 16, 255};
int[] FG_MOBS = {96, 192, 255, 255};
void setFill(PGraphicsOpenGL pg, int[] rgba) {
  pg.fill(rgba[0], rgba[1], rgba[2], rgba[3]);
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
  pg_obstacles.endDraw();
}


public void autoSpawnParticles() {
  if (AUTO_SPAWN && (frameCount%60) == 0) {
    float px = 100;
    float py = height-100;

    DwFlowFieldParticles.SpawnRadial sr = new DwFlowFieldParticles.SpawnRadial();
    sr.num(1);
    sr.dim(10, 10);
    sr.pos(px, height-1 - py);
    sr.vel(0, 0);
    particles.spawn(width, height, sr);
  }
}

static class MouseObstacle {
  int idx = 0;
  float px = 500;
  float py = 200;
  float r  = 60;
  float dx, dy;
  boolean moving = false;

  public MouseObstacle(int idx, float px, float py, float r) {
    this.idx = idx;
    this.px = px;
    this.py = py;
    this.r = r;
  }
  void draw(PGraphics pg, int[] rgba) {
    int cr = rgba[0];
    int cg = rgba[1];
    int cb = rgba[2];
    int ca = 255;

    pg.noStroke();
    pg.fill(cr, cg, cb, ca);
    pg.ellipse(px, py, r*2, r*2);
  }
  public boolean inside(float mx, float my) {
    dx = px - mx;
    dy = py - my;
    return (dx*dx + dy*dy) < (r*r);
  } 
  public void startMove(float mx, float my) {
    moving = inside(mx, my);
  }
  public void move(float mx, float my) {
    if (moving) {
      px = mx + dx;
      py = my + dy;
    }
  }
  public void endMove(float mx, float my) {
    moving = false;
  }
}



public void spawn(int rad, int count) {
  int vw = width;
  int vh = height;
  int px = mouseX;
  int py = mouseY; 
  py = vh - 1 - py;
  DwFlowFieldParticles.SpawnRadial sr = new DwFlowFieldParticles.SpawnRadial();
  sr.num(count);
  sr.dim(rad, rad);
  sr.pos(px, py);
  particles.spawn(vw, vh, sr);
}
