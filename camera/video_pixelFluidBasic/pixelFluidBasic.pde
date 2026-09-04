import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.dwgl.DwGLSLProgram;
import com.thomasdiewald.pixelflow.java.fluid.DwFluid2D;
import com.thomasdiewald.pixelflow.java.imageprocessing.DwOpticalFlow;
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.DwFilter;
import processing.core.*;
import processing.opengl.PGraphics2D;
import processing.video.Capture;


private class MyFluidData implements DwFluid2D.FluidData {

  @Override
    // this is called during the fluid-simulation update step.
    public void update(DwFluid2D fluid) {

    float px, py, vx, vy, radius, vscale;

    boolean mouse_input =  mousePressed;
    if (mouse_input ) {

      vscale = 15;
      px     = mouseX;
      py     = height-mouseY;
      vx     = (mouseX - pmouseX) * +vscale;
      vy     = (mouseY - pmouseY) * -vscale;

      if (mouseButton == LEFT) {
        radius = 20;
        fluid.addVelocity(px, py, radius, vx, vy);
      }
      if (mouseButton == CENTER) {
        radius = 50;
        fluid.addDensity (px, py, radius, 1.0f, 0.0f, 0.40f, 1f, 1);
      }
      if (mouseButton == RIGHT) {
        radius = 15;
        fluid.addTemperature(px, py, radius, 15f);
      }
    }
    // use the text as input for density
    if (ADD_DENSITY_MODE == 0) addDensityTexture (fluid, opticalflow);
    if (ADD_DENSITY_MODE == 1) addDensityTexture_cam(fluid, opticalflow);

    addVelocityTexture(fluid, opticalflow);
  }
}

int cam_w = 1600;
int cam_h = 1200;  
int view_w = 1920;
int view_h = (int)(view_w * cam_h/(float)cam_w);

int fluidgrid_scale = 3;      // grid size 

DwPixelFlow context;          // main library context
DwFilter filter;              // collection of imageprocessing filters
DwFluid2D fluid;              // fluid solver
MyFluidData cb_fluid_data;
DwOpticalFlow opticalflow;      // optical flow
PGraphics2D pg_cam_a, pg_cam_b;      // buffer for the capture-image
PGraphics2D pg_fluid;            // offscreen render-target for fluid  
Capture cam;                       // camera capture (video library)

// some state variables for the GUI/display
int     BACKGROUND_COLOR = 0;
boolean DISPLAY_SOURCE   = true;
boolean APPLY_BILATERAL  = true;

boolean DISPLAY_FLUID_TEXTURES  = true;

int     DISPLAY_fluid_texture_mode = 0;

int     ADD_DENSITY_MODE = 1;

public void setup() {    
   fullScreen(P2D,1);
 // size(720,1280,P2D);
  context = new DwPixelFlow(this);       // main library context    
  filter = new DwFilter(context);
  fluid = new DwFluid2D(context, view_w, view_h, fluidgrid_scale);       // fluid object
  // some fluid parameters
  fluid.param.dissipation_density     = 1f;
  fluid.param.dissipation_velocity    = 0.20f;
  fluid.param.dissipation_temperature = 0.5f;
  fluid.param.vorticity               = 0.090f;

  cb_fluid_data = new MyFluidData();                         // calback for adding fluid data
  fluid.addCallback_FluiData(cb_fluid_data);

  opticalflow = new DwOpticalFlow(context, cam_w, cam_h);         // optical flow object

  opticalflow.param.display_mode = 1;           // optical flow parameters  

  cam = new Capture(this, 1600, 1200, "USB Camera", 30);           // webcam capture
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
  if ( cam.available() ) {
    cam.read();      
    // render to offscreenbuffer
    pg_cam_b.beginDraw();
    pg_cam_b.background(0);
    pg_cam_b.image(cam, 0, 0);
    //  pg_cam_b.tint(255, 150, 0);    //  tint to select colors 
    pg_cam_b.endDraw();
    swapCamBuffer(); // "pg_cam_a" has the image now

    if (APPLY_BILATERAL) {
      filter.bilateral.apply(pg_cam_a, pg_cam_b, 5, 0.10f, 4);
      swapCamBuffer();
    }            
    opticalflow.update(pg_cam_a);  // update Optical Flow
  }
  fluid.update();                     // updates fluid ..   

  pg_fluid.beginDraw();                     // render everything
  pg_fluid.background(BACKGROUND_COLOR);
  if (DISPLAY_SOURCE && ADD_DENSITY_MODE == 0) {
    pg_fluid.image(pg_cam_a, 0, 0, view_w, view_h);
  }
  pg_fluid.endDraw();

  fluid.renderFluidTextures(pg_fluid, DISPLAY_fluid_texture_mode);    // add fluid stuff to rendering

  background(0);             // display result
  image(pg_fluid, 0, 0);
}

void swapCamBuffer() {                             // swapping function 
  PGraphics2D tmp = pg_cam_a;
  pg_cam_a = pg_cam_b;
  pg_cam_b = tmp;
}

public void fluid_resizeUp() {
  fluid.resize(width, height, fluidgrid_scale = max(1, --fluidgrid_scale));        // resize grid value
}
public void fluid_resizeDown() {                                                     // choose and finalize grid size
  fluid.resize(width, height, ++fluidgrid_scale);
}
public void fluid_reset() {
  fluid.reset();
}

public void fluid_displayMode(int val) {
  DISPLAY_fluid_texture_mode = val;
  DISPLAY_FLUID_TEXTURES = DISPLAY_fluid_texture_mode != -1;
}

public void opticalFlow_setDisplayMode(int val) {
  opticalflow.param.display_mode = val;
}

public void setAddDensityMode(int val) {
  ADD_DENSITY_MODE = val;
}
