
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
public boolean DISPLAY_DIST    = !true; 
public boolean AUTO_SPAWN      = true;
public boolean APPLY_BLOOM     = true;

float mul_attractors = 5f;

MouseObstacle[] mobs;

public void settings() {
  viewport_w = (int) min(viewport_w, displayWidth  * 0.9f);
  viewport_h = (int) min(viewport_h, displayHeight * 0.9f);
  size(viewport_w, viewport_h, P2D);
  smooth(0);
}


public void setup() {
  surface.setResizable(true);
  frameRate(1000);

  context = new DwPixelFlow(this);
  particles = new DwFlowFieldParticles(context, 1024 * 1024 * 4);

  particles.param.velocity_damping  = 1.00f;
  particles.param.steps = 1;
  particles.param.shader_collision_mult = 0.2f;

  particles.param.size_display   = 8;
  particles.param.size_collision = 8;
  particles.param.size_cohesion  = 2;

  particles.param.mul_coh = 5.00f;
  particles.param.mul_col = 0.70f;
  particles.param.mul_obs = 2.00f;

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

public void draw() {

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

  if (APPLY_BLOOM) {
    DwFilter filter = DwFilter.get(context);
    filter.luminance_threshold.param.threshold = 0.3f; // when 0, all colors are used
    filter.luminance_threshold.param.exponent  = 5;
    filter.luminance_threshold.apply(pg_canvas, pg_luminance);

    filter.bloom.setBlurLayers(10);
    //      filter.bloom.gaussianpyramid.setBlurLayers(10);
    filter.bloom.param.blur_radius = 1;
    filter.bloom.param.mult   = 1.2f;    //map(mouseX, 0, width, 0, 10);
    filter.bloom.param.radius = 0.1f;//map(mouseY, 0, height, 0, 1);
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
  if (AUTO_SPAWN && (frameCount%6) == 0) {
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
//////////////////////////////////////////////////////////////////////////////
//
// GUI
// Helper
// Parameters
// Interaction (Mouse, Keys)
//
//////////////////////////////////////////////////////////////////////////////

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

public void keyReleased() {
  if (key == 't') UPDATE_PHYSICS = !UPDATE_PHYSICS;

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


public void reset() {
  particles.reset();
}
public void set_size_display(int val) {
  particles.param.size_display = val;
}
public void set_size_cohesion(int val) {
  particles.param.size_cohesion = val;
}
public void set_size_collision(int val) {
  particles.param.size_collision = val;
}
public void set_velocity_damping(float val) {
  particles.param.velocity_damping = val;
}
public void set_collision_steps(int val) {
  particles.param.steps = val;
}
public void set_mul_acc(float val) {
  particles.param.mul_acc = val;
}
public void set_mul_col(float val) {
  particles.param.mul_col = val;
}
public void set_mul_coh(float val) {
  particles.param.mul_coh = val;
}
public void set_mul_obs(float val) {
  particles.param.mul_obs = val;
}
public void set_shader_collision_mult(float val) {
  particles.param.shader_collision_mult = val;
}

public void setParticleColor(int val) {
  float r=1f, g=1f, b=1f, a=1f, s=1f;
  float[] ca = particles.param.col_A;
  switch(val) {
  case 0: 
    r = 0.10f; 
    g = 0.50f; 
    b = 1.00f; 
    a = 10.0f; 
    s = 0.50f;  
    break;
  case 1: 
    r = 0.40f; 
    g = 0.80f; 
    b = 0.10f; 
    a = 10.0f; 
    s = 0.50f;  
    break;
  case 2: 
    r = 0.80f; 
    g = 0.40f; 
    b = 0.10f; 
    a = 10.0f; 
    s = 0.50f;  
    break;
  case 3: 
    r = 0.50f; 
    g = 0.50f; 
    b = 0.50f; 
    a = 10.0f; 
    s = 0.25f;  
    break;
  case 4: 
    r = ca[0]; 
    g = ca[1]; 
    b = ca[2]; 
    a =  1.0f; 
    s = 1.00f;  
    break;
  }
  particles.param.col_A = new float[]{ r, g, b, a };
  particles.param.col_B = new float[]{ r*s, g*s, b*s, 0 };
}

public void updateSelections(float[] val) {
  int ID = 0;
  DISPLAY_DIST        = val[ID++] > 0;
  AUTO_SPAWN          = val[ID++] > 0;
  APPLY_BLOOM         = val[ID++] > 0;
}


float mult_fg = 1f;
float mult_active = 2f;
float CR = 96;
float CG = 16;
float CB =  0;

int col_bg    ;
int col_fg    ;
int col_active;
