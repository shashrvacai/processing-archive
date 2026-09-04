import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.dwgl.DwGLSLProgram;
import com.thomasdiewald.pixelflow.java.fluid.DwFluid2D;
import com.thomasdiewald.pixelflow.java.imageprocessing.DwOpticalFlow;
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.DwFilter;

import controlP5.Accordion;
import controlP5.ControlP5;
import controlP5.Group;
import controlP5.RadioButton;
import controlP5.Toggle;
import processing.core.*;
import processing.opengl.PGraphics2D;
import processing.video.*;

int mov_w = 640;
int mov_h = 480;

int view_w = 1200;
int view_h = (int)(view_w * mov_h/(float)mov_w);

int gui_w = 200;
int gui_x = view_w;
int gui_y = 0;

int fluidgrid_scale = 1;

// main library context
DwPixelFlow context;

// collection of imageprocessing filters
DwFilter filter;

// fluid solver
DwFluid2D fluid;

MyFluidData cb_fluid_data;

// optical flow
DwOpticalFlow opticalflow;

// buffer for the capture-image
PGraphics2D pg_cam_a, pg_cam_b; 

// offscreen render-target for fluid
PGraphics2D pg_fluid;

// camera capture (video library)
//Capture cam;

// camera capture (video library)
Movie movie;


// some state variables for the GUI/display
int     BACKGROUND_COLOR = 0;
boolean DISPLAY_SOURCE   = true;
boolean APPLY_GRAYSCALE  = true;
boolean APPLY_BILATERAL  = true;
int     VELOCITY_LINES   = 6;

boolean UPDATE_FLUID            = true;
boolean DISPLAY_FLUID_TEXTURES  = true;
boolean DISPLAY_FLUID_VECTORS   = !true;
boolean DISPLAY_PARTICLES       = !true;

int     DISPLAY_fluid_texture_mode = 0;

int     ADD_DENSITY_MODE = 1;


public void settings() {
  size(view_w + gui_w, view_h, P2D);
  smooth(4);
}

public void setup() {

  // main library context
  context = new DwPixelFlow(this);
  context.print();
  context.printGL();

  filter = new DwFilter(context);

  // fluid object
  fluid = new DwFluid2D(context, view_w, view_h, fluidgrid_scale);

  // some fluid parameters
  fluid.param.dissipation_density     = 0.90f;               // need mapping
  
  fluid.param.dissipation_velocity    = 0.80f;
  fluid.param.dissipation_temperature = 0.70f;
  fluid.param.vorticity               = 0.30f;

  // calback for adding fluid data
  cb_fluid_data = new MyFluidData();
  fluid.addCallback_FluiData(cb_fluid_data);

  // optical flow object
  opticalflow = new DwOpticalFlow(context, mov_w, mov_h);

  // optical flow parameters    
  opticalflow.param.display_mode = 1;

  // webcam capture
  movie = new Movie(this, "transit.mov");
  movie.loop();
  //cam.start();

  // render buffers
  pg_cam_a = (PGraphics2D) createGraphics(mov_w, mov_h, P2D);
  pg_cam_a.noSmooth();
  pg_cam_a.beginDraw();
  pg_cam_a.background(0);
  pg_cam_a.endDraw();

  pg_cam_b = (PGraphics2D) createGraphics(mov_w, mov_h, P2D);
  pg_cam_b.noSmooth();

  pg_fluid = (PGraphics2D) createGraphics(view_w, view_h, P2D);
  pg_fluid.smooth(4);


  createGUI();

  background(0);
  frameRate(33);
}




public void draw() {

  if ( movie.available() ) {
    movie.read();

    // render to offscreenbuffer
    pg_cam_b.beginDraw();
    pg_cam_b.background(0);
    pg_cam_b.image(movie, 0, 0);
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

  // add optical flow stuff to rendering
  if (opticalflow.param.display_mode == 2) {
    opticalflow.renderVelocityShading(pg_fluid);
  }
  opticalflow.renderVelocityStreams(pg_fluid, VELOCITY_LINES);


  // display result
  background(0);
  image(pg_fluid, 0, 0);

  // info
  String txt_fps = String.format(getClass().getName()+ "   [size %d/%d]   [frame %d]   [fps %6.2f]", mov_w,mov_h, opticalflow.UPDATE_STEP, frameRate);
  surface.setTitle(txt_fps);
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
public void fluid_togglePause() {
  UPDATE_FLUID = !UPDATE_FLUID;
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


public void mouseReleased() {
}
public void keyReleased() {
  if (key == 'p') fluid_togglePause(); // pause / unpause simulation
  if (key == '+') fluid_resizeUp();    // increase fluid-grid resolution
  if (key == '-') fluid_resizeDown();  // decrease fluid-grid resolution
  if (key == 'r') fluid_reset();       // restart simulation

}
