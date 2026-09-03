import java.util.Locale;
import processing.sound.*;
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
import org.openkinect.processing.*;

boolean START_FULLSCREEN = false;
boolean ON = true ;
int viewport_w = 1680;
int viewport_h = 1024;
int viewport_x = 230;
int viewport_y = 250;
boolean R = false ;
float dMin = 600 ;                             // --- kinect depth min 
float dMax = 1000 ;                             // ----  kinect depth max
float ScaleVal =  3 ;       // increse the SIZE of the kinect image
Amplitude amp ;
AudioIn in;
PGraphics2D pg_canvas;
PGraphics2D pg_obstacles;
PGraphics2D pg_impulse;
PGraphics2D pg_luminance;
DwFlowFieldParticles particles;
DwFlowField ff_acc;
DwFlowField ff_impulse;
DwFlowField ff_attractors;
DwPixelFlow context;
Kinect2 K ; 
DwGLSLProgram shd_attractors;

public boolean UPDATE_PHYSICS  = true;
public boolean DISPLAY_DIST    = !true;
public boolean DISPLAY_FLOW    = !true;  
public boolean AUTO_SPAWN      = true;
public boolean APPLY_BLOOM     = true;
MouseObstacle[] mobs;
float mul_attractors = 5f;

public void settings() {
  if (START_FULLSCREEN) {
    viewport_w = displayWidth;
    viewport_h = displayHeight;
    viewport_x = displayWidth;
    viewport_y = 0;
    fullScreen(P2D,2);   // --------------------------------number if the display 
  } else {
    viewport_w = (int) min(viewport_w, displayWidth  * 0.9f);
    viewport_h = (int) min(viewport_h, displayHeight * 0.9f);
    size(viewport_w, viewport_h, P2D);
  }
  smooth(0);
}


public void setup() { 
  // sound
  amp = new Amplitude(this);
  in  = new AudioIn(this,0);
  in.start();
  amp.input(in); 
  
  // kinect
  K = new Kinect2(this);
  K.initDepth(); //------------------------------------ int depth ; 
  K.initDevice();
  // ---- setup
  surface.setLocation(100, 1000);
  surface.setResizable(true);

  context = new DwPixelFlow(this);
  context.print();
  context.printGL();
  particles = new DwFlowFieldParticles(context, 1024 * 1024 * 4);
  ff_acc = new DwFlowField(context); 
  ff_impulse = new DwFlowField(context);
  ff_attractors = new DwFlowField(context);
  shd_attractors = context.createShader("data/attractors.frag");
  resizeScene();
  particles.param.col_A = new float[]{0f, 0.50f, 10f, 5};
  particles.param.col_B = new float[]{0.05f, 0.25f, 0.40f, 0};
  
  frameRate(5000);
}
// dynamically resize if surface-size changes

public boolean resizeScene() {
  boolean[] RESIZED = { true };
  pg_canvas     = DwUtils.changeTextureSize(this, pg_canvas, width, height, 0, RESIZED);
  pg_obstacles  = DwUtils.changeTextureSize(this, pg_obstacles, width, height, 0, RESIZED);
  pg_impulse    = DwUtils.changeTextureSize(this, pg_impulse, width, height, 0, RESIZED);
  pg_luminance  = DwUtils.changeTextureSize(this, pg_luminance, width, height, 0, RESIZED);
  if (RESIZED[0]) {
    setParticleColor(2);
  }
  return RESIZED[0];
}


public void draw() {
  // ---- sound
  float aa = amp.analyze()*10;
  //------ kinect 
   PImage dep =  K.getDepthImage();
  //image(dep,0,0);   // test depth image
  int[]  Rdep = K.getRawDepth();
  
  // kinect mean ... 
  float sumX = 0 ;   /// sum of X 
  float sumY = 0 ;   /// sum of Y
  float totalP = 0 ;   /// total number of pixels 
  float s = 2;    // skip
  float r = 2;    // range
  for (int x = 0; x < dep.width; x+=s) {
    for (int y = 0; y < dep.height; y+=s) {
      int  i = x + y* dep.width;    // index 
      float b = brightness(dep.pixels[i]);  
      int d = Rdep[i];   // depth index
      float n = map(d, dMin, dMax, 10, 255);
      float si = map(n, 0, 255, s*r, s/r);
      //float si = map(n, 0, 255, s*r, s/r);   ///reverse

      float m = map(b, 0, 255, 8, 50); // mapping brightness values 

      if (d >dMin && d <dMax) {
        fill(255-n,200,255, n);   // pink to orange
        noStroke();
        pushMatrix();       
        //rotate(PI);
        translate(200, -height/10);
        scale(ScaleVal);
          ellipse(x, y, si, si);
        popMatrix();
        sumX += x ;
        sumY += y ;
        totalP ++ ;
      } else {
      }
    }
  }

  float auX = sumX /totalP ;
  float auY = sumY /totalP ;

  pushMatrix();        
  translate(00, -height/10);
  scale(ScaleVal);
 // ellipse(auX, auY, 10, 10);
  popMatrix();
  
  mobs = new MouseObstacle[1];
  //mobs[0] = new MouseObstacle(0, auX*3, auY*3- height/10, 0);
  mobs[0] = new MouseObstacle(0, (auX*ScaleVal),(auY*ScaleVal- height/10), 0);
  
  particles.param.velocity_damping  = 1.00f;
  particles.param.steps = 1;
  particles.param.shader_collision_mult = 0.2f;

  particles.param.size_display   = 8;                                     // particle size
  particles.param.size_collision = 10;//floor(map(aa,0,1,6,2));
  particles.param.size_cohesion  = floor(map(aa,0,1,8,7));

  particles.param.mul_coh = floor(map(aa,0,1,10,7));
  particles.param.mul_col = floor(map(aa,0,1,2,4));
  particles.param.mul_obs = 2.00f;
  
  
  particles.param.timestep = 1/frameRate;
  resizeScene();
  updateScene();
   
 if( ON == true){
  autoSpawnParticles(width- (auX*ScaleVal),height- (auY*ScaleVal- height/10), 2);
  } else{
  }
 
  addImpulse();
  addAttractors();
  particleSimulation();

  if (!DISPLAY_DIST) {
    pg_canvas.beginDraw();  
    fill(0, 15);
    rect(0, 0, width, height);
    //pg_canvas.blendMode(ADD);
    pg_canvas.background(0, 0);
    //pg_canvas.blendMode(BLEND);   
    pg_canvas.image(pg_obstacles, 0, 0);
    pg_canvas.endDraw();
    particles.displayParticles(pg_canvas);
  }

  image(pg_canvas, 0, 0);
}

void keyPressed(){
  if(key == 'u'){
    ON = !ON ;
  } 
}
