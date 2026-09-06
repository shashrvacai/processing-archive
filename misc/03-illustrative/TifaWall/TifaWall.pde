import java.util.Locale;

import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.flowfieldparticles.DwFlowFieldParticles;
import com.thomasdiewald.pixelflow.java.imageprocessing.DwFlowField;
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.DwFilter;
import processing.core.*;
import processing.opengl.PGraphics2D;

import processing.sound.*;

Amplitude amp ;
AudioIn in;

float dim =60;
int viewp_w = 786;
int viewp_h = 1366;

PGraphics2D pg_canvas;
PGraphics2D pg_obstacles;

DwPixelFlow context;
DwFlowField ff_acc;
DwFlowFieldParticles particles;

DwFlowFieldParticles.SpawnRect spawn = new DwFlowFieldParticles.SpawnRect();

public void settings() {
  size(viewp_w, viewp_h, P2D);
  smooth(0);
}

public void setup() {
 amp = new Amplitude(this);
  in  = new AudioIn(this,0);
  in.start();
  amp.input(in);
  
  pg_canvas = (PGraphics2D) createGraphics(width, height, P2D);
  pg_canvas.smooth(0);

  int border = 20;
  pg_obstacles = (PGraphics2D) createGraphics(width, height, P2D);

  // library context
  context = new DwPixelFlow(this);

  // optical flow 
  ff_acc = new DwFlowField(context);
  ff_acc.resize(width, height);
  //    border = 120;
  float dimx = width  - border;
  float dimy = height - border;

  int particle_size = 3;
  int numx = (int) (dimx / (0.9f*particle_size));
  int numy = (int) (dimy / (0.9f*particle_size));

  // particle spawn-def, rectangular shape
  spawn.num(numx, numy);
  spawn.dim(dimx, dimy);
  spawn.pos(width/2-dimx/2, height/2-dimy/2);
  spawn.vel(0, 0);

  // partcle simulation
  particles = new DwFlowFieldParticles(context, numx * numy);
  // particles.param.col_A = new float[]{0.40f, 0.80f, 0.10f, 3};
  // particles.param.col_B = new float[]{0.20f, 0.40f, 0.05f, 0};
  // particles.param.col_B = new float[]{0.80f, 0.40f, 0.80f, 0};
  particles.param.col_A = new float[]{0.15f, 0.50f, 0.80f, 3};
  particles.param.col_B = new float[]{1.5f, 0.10f, 0.10f, 0};
  particles.param.shader_type = 1;
  particles.param.shader_collision_mult = 0.4f;
  particles.param.steps = 1;
  particles.param.velocity_damping  = 0.999f;
  particles.param.size_display   = ceil(particle_size * 1.5f);
  particles.param.size_collision = particle_size;
  particles.param.size_cohesion  = particle_size;

  // init stuff that doesn't change
  particles.resizeWorld(width, height); 
  particles.spawn(width, height, spawn);
  particles.createObstacleFlowField(pg_obstacles, new int[]{0, 0, 0, 255}, false);

  frameRate(1000);
}

public void draw() { 
  float a = amp.analyze()*10;
  
  particles.param.timestep = 1f/frameRate;    
  updateScene();


  // update particles, using the opticalflow for acceleration
  particles.createObstacleFlowField(pg_obstacles, new int[]{0, 0, 0, 255}, false);
  // particles.update(opticalflow.frameCurr.velocity);
  particles.update(ff_acc);

  // render obstacles + particles
  pg_canvas.beginDraw(); 
  pg_canvas.image(pg_obstacles, 0, 0);


  pg_canvas.endDraw();
  particles.displayParticles(pg_canvas);

  particles.param.mul_coh = map(a, 0, 10, 0.01f, 10.0f);
  particles.param.mul_col = map(a, 0, 10, 0.01f, 5.0f);
  particles.param.mul_obs = 2.00f;
  particles.param.mul_acc = 0.10f; // optical flow multiplier
  particles.param.wh_scale_obs = 0;
  particles.param.wh_scale_coh = 5;
  particles.param.wh_scale_col = 0;
  // display result
  image(pg_canvas, 0, 0);
}

public void keyReleased() {
  particles.spawn(width, height, spawn);
}
