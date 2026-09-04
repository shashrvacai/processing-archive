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

ArrayList<star> starArray = new ArrayList<star>();

star neuerStern;

float cc1 =  4, cc2 =  4, cc3 =2, cc4 =  5, cc5 =  0.7, cc6 =2, cc7 =0, cc8= 0, cc9 = 0;  // ------ > sliders from MAX 
float cc10 =  0, cc11 = 0, cc12 =  0, cc13 =0, s11 =  0, cc14 =  0, cc15 =  0, cc16 =0, cc17 =0 ,cc18 = 0.1 ,cc19 = 10 ;

PImage colormap;
PVector pos, nOff, starcontrol, originePoint = new PVector(0, 0), pos1, pos2, SFnOff ;
float  r, sep = 20, mF = 0, sz =  20, col = 0, fly = 2, xmotion = 0, ymotion = 0, rmotion = 0;
float farmnx = 0, farmny = 0, farmnz = 0;
float [][] terrain;
int num=42, frames = 90;
float thetaDoor = 0;

int state, numberOfStars = 2000, newStars =20, cols, rows, scl= 30, w = 4800, h =4800, elems = 120, dots = 120;
int dots_step = 1, elems_step = 1, sTunnel = 0 ;
float []ldmotion = new float[elems * dots];
color BGCol = color(0), VehCol = color(255);

float C = 0.01 ;
float aR = 0.01 ;

// AP------------------------------------
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
int sLife = 0;
float mul_attractors = 5f;

MouseObstacle[] mobs;



void setup() { 
  // --------------------------------- OSc connection
  oscP5 = new OscP5(this, 12000);   

  spout = new Spout(this);   ////  ----  Spout
  spout.createSender("Cyberia Closing");
 

  //------------------------------------- setup
  //fullScreen(OPENGL, 1);       
  size(1000, 1000, OPENGL);
  background(BGCol);
  noiseDetail(2, 0.5);
  // ----------------------------------- objects
  neuerStern= new star();   
  //------------------------------------ variables
  state= 1 ;    /// ---  intitial state  
  pos = new PVector(width/2, height/2);
  nOff = new PVector(random(10000), random(1000)); 
  starcontrol = new PVector(width/2, height/2);
  // -------------------------------- geoRun 
  cols = w /scl;
  rows = h/scl;
  terrain = new float[cols][rows];  
  // ----------- tunnel declaration  
  frameRate(60);    // ------------------ frame rate 

  colormap = loadImage("01.jpg");    // image for color map 

  for (int e = 0; e < elems; e += elems_step) {
    for (int d = 0; d < dots; d += dots_step) {
      ldmotion[d + e * dots] = random(0.005);
    }
  }
  
  // AP 
  aR =map(cc16,0,127,2,width/2) ;
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

void draw() {
 // println(cc1);
  spout.sendTexture();
  float aa = map(mouseX, 0, width, -1, 1);
  sLife++ ;

  if (state == 0) {    //  
  C = map(cc16,0,127,0.001,1);
  
  particles.param.velocity_damping  =0.99;
  particles.param.steps = 1;
  particles.param.shader_collision_mult =0.2;
  println(cc12);
  particles.param.size_display   = 8;
  particles.param.size_collision = (int)map(cc12,0,127,0.1,50.00);;
  particles.param.size_cohesion  =(int) map(cc11,0,127,0.1,50.00);  // cc11
  particles.param.mul_coh = (int) map(cc13,0,127,0.1,50.00);
  particles.param.mul_col = 0.70f;
  particles.param.mul_obs = (int) map(cc14,0,127,0.1,50.00);

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
  filter.bloom.param.radius = (int) map(cc15,0,127,0.1,4);
  filter.bloom.apply(pg_luminance, null, pg_canvas);

  blendMode(REPLACE);
  image(pg_canvas, 0, 0);
  blendMode(BLEND);
  
  C++ ;
  } else if (state == 1) {    //  ----------1
        noStroke(); 
    fill(0, 5);
    rect(0, 0, 2*width, 2*height);
    noFill();
    fill(255);
    neuerStern.render();
   
    for (int i = 0; i<newStars; i++) {   // star init   
      starArray.add(new star());
    
    }
    for (int i = 0; i<starArray.size(); i++) {
      if (starArray.get(i).x<0||starArray.get(i).x>width||starArray.get(i).y<0||starArray.get(i).y>height) starArray.remove(i);
      starArray.get(i).move();
      starArray.get(i).render();
    }
    if (starArray.size()>numberOfStars) {//
      for (int i = 0; i<newStars; i++) {
        starArray.remove(i);
      }
    }
  } else if (state == 2) {    /// --    ------------ 2      ---  star feild    
        pushMatrix();
    fill(0, 20);
    rectMode(CENTER);
    translate(width/2, 3*height/4, -width*4);
    rect(0, 0, 8*width, 8* height);   
    popMatrix();
    float AmL = map(cc16,0,127,0,500);     /// required multiplication factor 
    fly -= map(cc18,0,127,0.1,1);
    float  yOff =fly;
    for ( int y = 0; y < rows; y ++) {
      float xOff = 0;
      for (int x = 0; x < cols; x ++) {
        terrain[x][y] =  map(noise(xOff, yOff), 0, 1, -AmL, AmL);  //with noise
        xOff+=0.1;
      }
      yOff +=0.1;
    }
    stroke(255);
    strokeWeight(map(cc17, 0, 127, 0.1, 5));  /// perlin feild point size
    noFill();

    rotateX(-4);
    rotateZ(0.75);   
    translate(-w/4, -h/2);
    for ( int y = 0; y < rows-1; y ++) {
      for (int x = 0; x < cols; x ++) {
        point(x*scl, y*scl, terrain[x][y]);
      }
      endShape();
    }
  } else if (state == 3) {    //     ----3
      draw_landscape(map(cc1, 0, 127, 0, 0.2));    // cc1
  } else if (state == 4) { 

  } else if (state == 6) {
  } else if (state == 7) { 
    fill(0, 15);
    rect(0, 0, width, height);
    noFill();
    strokeWeight(2);  
    float sw = map(aa, 0, 1, 0, 155);
    stroke (255);
    fill(sw);
    drawStream (aa);
  }

  r = random(400);
  pos.x = map(noise(nOff.x), 0, 1, 0, width);
  pos.y = map(noise(nOff.y), 0, 1, 0, height);
  nOff.add(aa/10, aa/10, 0);
  //fill(255);                                                        // random walker debugger
  //ellipse(pos.x,pos.y,40,40);

  if (keyPressed== true && key == '5') {
    blendMode(DIFFERENCE);
    fill(255);
    ellipse(random(pos.x, width-pos.x), random(pos.y, height-pos.y), r, r);
  }
}

void keyTyped() {
  if (key =='0')           state = 0 ;
  else if (key =='1')      state = 1 ;
  else if (key =='2')      state = 2 ;
  else if (key =='3')      state = 3 ;
  else if (key =='4')      state = 4 ;
  else if (key =='6')      state = 6 ;
  else if (key =='7')      state = 7 ;
  else if (key == 'm') colormap = loadImage("01.jpg");
  else if (key == ',') colormap = loadImage("04.png");
  else if (key == '.') colormap = loadImage("02.png");
  else if (key == '/') colormap = loadImage("03.png");
}
void keyPressed() {
  if (key == 'z')    background(0);
}
