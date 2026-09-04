import codeanticode.syphon.*;
import java.util.Locale;
import oscP5.*;
OscP5 oscP5;
 
import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.dwgl.DwGLSLProgram;
import com.thomasdiewald.pixelflow.java.fluid.DwFluid2D;
import com.thomasdiewald.pixelflow.java.imageprocessing.DwOpticalFlow;
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.DwFilter;

import processing.core.*;
import processing.opengl.PGraphics2D;
import processing.video.Capture;

SyphonServer server;
float s1 =  0.90 , s2  = 0.80 , s3 = 0.70 , s4 = 0.30 ,s5 = 28,s6 = 0.61  ; 

int cam_w = 640;
int cam_h = 480;

int view_w = 1200;
int view_h = (int)(view_w * cam_h/(float)cam_w);

int gui_w = 0;
int gui_x = view_w;
int gui_y = 0;

int fluidgrid_scale = 1;

DwPixelFlow context; // main library context
DwFilter filter; // collection of imageprocessing filters
DwFluid2D fluid; // fluid solver
MyFluidData cb_fluid_data;
DwOpticalFlow opticalflow; // optical flo
PGraphics2D pg_cam_a, pg_cam_b;  // buffer for the capture-image
PGraphics2D pg_fluid; // offscreen render-target for fluid
Capture cam; // camera capture (video library)

// some state variables for the GUI/display
int     BACKGROUND_COLOR = 0;
boolean DISPLAY_SOURCE   = true;
boolean APPLY_GRAYSCALE  = false;
boolean APPLY_BILATERAL  = true;
int     VELOCITY_LINES   = 10000;

boolean UPDATE_FLUID            = true;
boolean DISPLAY_FLUID_TEXTURES  = true;
boolean DISPLAY_FLUID_VECTORS   = !true;
boolean DISPLAY_PARTICLES       = !true;

int     DISPLAY_fluid_texture_mode = 0;
int     ADD_DENSITY_MODE = 1;
PGraphics2D pg_canvas;

public void settings() {
  size(view_w + gui_w, view_h, P2D);
  smooth(4);
}

public void setup() {  
  oscP5 = new OscP5(this, 12000);                            // OSc sending   
  server = new SyphonServer(this, "Liquify");      // syphon server
  
  // main library context
  context = new DwPixelFlow(this);
  context.print();
  context.printGL();

  filter = new DwFilter(context);
  // fluid object
  fluid = new DwFluid2D(context, view_w, view_h, fluidgrid_scale);
  // some fluid parameters

  // calback for adding fluid data
  cb_fluid_data = new MyFluidData();
  fluid.addCallback_FluiData(cb_fluid_data);

  // optical flow object
  opticalflow = new DwOpticalFlow(context, cam_w, cam_h);
  // webcam capture
  cam = new Capture(this, cam_w, cam_h, 30);
  cam.start();

  // render buffers
  pg_cam_a = (PGraphics2D) createGraphics(cam_w, cam_h, P2D);
  pg_cam_a.noSmooth();
  pg_cam_a.beginDraw();
  pg_cam_a.background(0);
  pg_cam_a.endDraw();

  pg_cam_b = (PGraphics2D) createGraphics(cam_w, cam_h, P2D);
  pg_cam_b.noSmooth();

  pg_fluid = (PGraphics2D) createGraphics(view_w, view_h, P2D);
  pg_fluid.smooth(4);

  background(0);
  frameRate(60);
}

public void draw() {
  server.sendScreen();                                 //     send screen
  fluid.param.dissipation_density     = 0.90f ;        
  fluid.param.dissipation_velocity    = s2;
  fluid.param.dissipation_temperature = s3;
  fluid.param.vorticity               = s4;
  fluid.param.num_jacobi_projection   = int(s5) ;
  fluid.param.timestep = s6 ; // ----0 -1

  if ( cam.available() ) {
    cam.read();
    // render to offscreenbuffer
    pg_cam_b.beginDraw();
    pg_cam_b.background(0);
    pg_cam_b.image(cam, 0, 0);
    pg_cam_b.endDraw();
    swapCamBuffer(); // "pg_cam_a" has the image now

    if (APPLY_BILATERAL) {
      filter.bilateral.apply(pg_cam_a, pg_cam_b, 5, 0.10f, 4);
      swapCamBuffer();
    }
    // update Optical Flow
    opticalflow.update(pg_cam_a);

    if (APPLY_GRAYSCALE) {
      // make the capture image grayscale (for better contrast)
      filter.luminance.apply(pg_cam_a, pg_cam_b); 
      swapCamBuffer();
    }
  }

  if (UPDATE_FLUID) {
    fluid.update();
  }

  // render everything
  pg_fluid.beginDraw();
  pg_fluid.background(BACKGROUND_COLOR);
  if (DISPLAY_SOURCE && ADD_DENSITY_MODE == 0) {
    pg_fluid.image(pg_cam_a, 0, 0, view_w, view_h);
  }
  pg_fluid.endDraw();

  // add fluid stuff to rendering
  if (DISPLAY_FLUID_TEXTURES) {
    fluid.renderFluidTextures(pg_fluid, DISPLAY_fluid_texture_mode);
  }

  if (DISPLAY_FLUID_VECTORS) {
    fluid.renderFluidVectors(pg_fluid, 10);
  }

  // addw optical flow stuff to rendering
  if (opticalflow.param.display_mode == 2) {
    opticalflow.renderVelocityShading(pg_fluid);
  }
  opticalflow.renderVelocityStreams(pg_fluid, VELOCITY_LINES);

  // display result
  background(0);
  image(pg_fluid, 0, 0);
}


void swapCamBuffer() {
  PGraphics2D tmp = pg_cam_a;
  pg_cam_a = pg_cam_b;
  pg_cam_b = tmp;
}


public void fluid_resizeUp() {
  fluid.resize(width, height, fluidgrid_scale = max(1, --fluidgrid_scale));
}
public void fluid_resizeDown() {
  fluid.resize(width, height, ++fluidgrid_scale);
}
public void fluid_reset() {
  fluid.reset();
}

public void fluid_displayMode(int val) {
  DISPLAY_fluid_texture_mode = val;
  DISPLAY_FLUID_TEXTURES = DISPLAY_fluid_texture_mode != -1;
}
public void fluid_displayVelocityVectors(int val) {
  DISPLAY_FLUID_VECTORS = val != -1;
}
public void fluid_displayParticles(int val) {
  DISPLAY_PARTICLES = val != -1;
}
public void opticalFlow_setDisplayMode(int val) {
  opticalflow.param.display_mode = val;
}
public void activeFilters(float[] val) {
  APPLY_GRAYSCALE = (val[0] > 0);
  APPLY_BILATERAL = (val[1] > 0);
}
public void setOptionsGeneral(float[] val) {
  DISPLAY_SOURCE = (val[0] > 0);
}

public void setAddDensityMode(int val) {
  ADD_DENSITY_MODE = val;
}

public void keyReleased() {

  if (key == '+') fluid_resizeUp();    // increase fluid-grid resolution
  if (key == '-') fluid_resizeDown();  // decrease fluid-grid resolution
  if (key == 'r') fluid_reset();       // restart simulation

  if (key == 'w') DISPLAY_FLUID_VECTORS  = !DISPLAY_FLUID_VECTORS;
}

void oscEvent(OscMessage theOscMessage) {       /// osc message to MAX
  float v1 = theOscMessage.get(0).floatValue();  
  float v2 = theOscMessage.get(0).floatValue();  
  float v3 = theOscMessage.get(0).floatValue();  
  float v4 = theOscMessage.get(0).floatValue();  
  float v5 = theOscMessage.get(0).floatValue(); 
  float v6 = theOscMessage.get(0).floatValue();  

  if (theOscMessage.checkAddrPattern("/s1")) {   //  message reciever      
    s1 = v1;
  }  else if (theOscMessage.checkAddrPattern("/s2")) {   //  message reciever      
    s2 = v2;
  } else if (theOscMessage.checkAddrPattern("/s3")) {   //  message reciever      
    s3 = v3;
  } else if (theOscMessage.checkAddrPattern("/s4")) {   //  message reciever      
    s4 = v4;
  } else if (theOscMessage.checkAddrPattern("/s5")) {   //  message reciever      
    s5 = v5;
  } else if (theOscMessage.checkAddrPattern("/s6")) {   //  message reciever      
    s6 = v6;
  } 
} 
