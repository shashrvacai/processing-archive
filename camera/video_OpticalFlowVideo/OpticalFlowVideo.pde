
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


int cam_w = 640;
int cam_h = 640;

int view_w = 1280;
int view_h = 720;

int gui_w = 200;
int gui_x = view_w+ gui_w;      // position of the gui X&Y
int gui_y = 0;

int fluidgrid_scale = 1;

DwPixelFlow context;     // main library context
DwFilter filter;         // collection of imageprocessing filters

DwFluid2D fluid;         // fluid solver 

MyFluidData cb_fluid_data;
DwOpticalFlow opticalflow;
PGraphics2D pg_cam_a, pg_cam_b; 
PGraphics2D pg_fluid;

Movie movie;

int     BACKGROUND_COLOR = 0;
boolean DISPLAY_SOURCE   = !true;
boolean APPLY_GRAYSCALE  = false;
boolean APPLY_BILATERAL  = true;
int     VELOCITY_LINES   = 6;

boolean UPDATE_FLUID            = true;
boolean DISPLAY_FLUID_TEXTURES  = true;
boolean DISPLAY_FLUID_VECTORS   = !true;
boolean DISPLAY_PARTICLES       = !true;

int     DISPLAY_fluid_texture_mode = 0;
int     ADD_DENSITY_MODE = 1;

public void settings() {
  size(view_w + (gui_w*2), view_h+400, P2D);
  smooth(4);
}

public void setup() {
  // main library context
  context = new DwPixelFlow(this);
  
  filter = new DwFilter(context);
  
  // fluid object
  fluid = new DwFluid2D(context, view_w, view_h, fluidgrid_scale);

  // some fluid parameters
  fluid.param.dissipation_density     = 0.90f;
  fluid.param.dissipation_velocity    = 0.80f;
  fluid.param.dissipation_temperature = 0.70f;
  fluid.param.vorticity               = 0.30f;

  // calback for adding fluid data
  cb_fluid_data = new MyFluidData();
  fluid.addCallback_FluiData(cb_fluid_data);

  // optical flow object
  opticalflow = new DwOpticalFlow(context, cam_w, cam_h);

  // optical flow parameters    
  opticalflow.param.display_mode = 1;

  // webcam capture
  movie = new Movie(this, "chariotS.mov");
  movie.play();
  movie.loop();
  // render buffers
  pg_cam_a = (PGraphics2D) createGraphics(cam_w, cam_h+100, P2D);   //make sure to change the values for pg_cam_b and pfFluid
  pg_cam_a.noSmooth(); 
  pg_cam_a.beginDraw();
  pg_cam_a.background(0);
  pg_cam_a.endDraw();

  pg_cam_b = (PGraphics2D) createGraphics(cam_w, cam_h+100, P2D);
  pg_cam_b.noSmooth();

  pg_fluid = (PGraphics2D) createGraphics(view_w, view_h+100, P2D);
  pg_fluid.smooth(4);


 createGUI();

  background(0);
  frameRate(60);
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
  String txt_fps = String.format(getClass().getName()+ "   [size %d/%d]   [frame %d]   [fps %6.2f]", cam_w, cam_h, opticalflow.UPDATE_STEP, frameRate);
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

  if (key == '1') DISPLAY_fluid_texture_mode = 0; // density
  if (key == '2') DISPLAY_fluid_texture_mode = 1; // temperature
  if (key == '3') DISPLAY_fluid_texture_mode = 2; // pressure
  if (key == '4') DISPLAY_fluid_texture_mode = 3; // velocity

  if (key == 'q') DISPLAY_FLUID_TEXTURES = !DISPLAY_FLUID_TEXTURES;
  if (key == 'w') DISPLAY_FLUID_VECTORS  = !DISPLAY_FLUID_VECTORS;
  if (key == 'e') DISPLAY_PARTICLES      = !DISPLAY_PARTICLES;
}





ControlP5 cp5;

public void createGUI() {

  cp5 = new ControlP5(this);

  int sx, sy, px, py, oy;

  sx = 100; 
  sy = 14;
  oy = (int)(sy*1.5f);


  ////////////////////////////////////////////////////////////////////////////
  // GUI - FLUID
  ////////////////////////////////////////////////////////////////////////////
  Group group_fluid = cp5.addGroup("fluid");
  {
    group_fluid.setHeight(20).setSize(gui_w, 300)
      .setBackgroundColor(color(16, 180)).setColorBackground(color(16, 180));
    group_fluid.getCaptionLabel().align(CENTER, CENTER);

    px = 10; 
    py = 15;

    cp5.addButton("reset").setGroup(group_fluid).plugTo(this, "fluid_reset"     ).setSize(80, 18).setPosition(px, py);
    cp5.addButton("+"    ).setGroup(group_fluid).plugTo(this, "fluid_resizeUp"  ).setSize(39, 18).setPosition(px+=82, py);
    cp5.addButton("-"    ).setGroup(group_fluid).plugTo(this, "fluid_resizeDown").setSize(39, 18).setPosition(px+=41, py);

    px = 10;

    cp5.addSlider("velocity").setGroup(group_fluid).setSize(sx, sy).setPosition(px, py+=(int)(oy*1.5f))
      .setRange(0, 1).setValue(fluid.param.dissipation_velocity).plugTo(fluid.param, "dissipation_velocity");

    cp5.addSlider("density").setGroup(group_fluid).setSize(sx, sy).setPosition(px, py+=oy)
      .setRange(0, 1).setValue(fluid.param.dissipation_density).plugTo(fluid.param, "dissipation_density");

    cp5.addSlider("temperature").setGroup(group_fluid).setSize(sx, sy).setPosition(px, py+=oy)
      .setRange(0, 1).setValue(fluid.param.dissipation_temperature).plugTo(fluid.param, "dissipation_temperature");

    cp5.addSlider("vorticity").setGroup(group_fluid).setSize(sx, sy).setPosition(px, py+=oy)
      .setRange(0, 1).setValue(fluid.param.vorticity).plugTo(fluid.param, "vorticity");

    cp5.addSlider("iterations").setGroup(group_fluid).setSize(sx, sy).setPosition(px, py+=oy)
      .setRange(0, 80).setValue(fluid.param.num_jacobi_projection).plugTo(fluid.param, "num_jacobi_projection");

    cp5.addSlider("timestep").setGroup(group_fluid).setSize(sx, sy).setPosition(px, py+=oy)
      .setRange(0, 1).setValue(fluid.param.timestep).plugTo(fluid.param, "timestep");

    cp5.addSlider("gridscale").setGroup(group_fluid).setSize(sx, sy).setPosition(px, py+=oy)
      .setRange(0, 50).setValue(fluid.param.gridscale).plugTo(fluid.param, "gridscale");

    RadioButton rb_setFluid_DisplayMode = cp5.addRadio("fluid_displayMode").setGroup(group_fluid).setSize(80, 18).setPosition(px, py+=(int)(oy*1.5f))
      .setSpacingColumn(2).setSpacingRow(2).setItemsPerRow(2)
      .addItem("Density", 0)
      .addItem("Temperature", 1)
      .addItem("Pressure", 2)
      .addItem("Velocity", 3)
      .activate(DISPLAY_fluid_texture_mode);
    for (Toggle toggle : rb_setFluid_DisplayMode.getItems()) toggle.getCaptionLabel().alignX(CENTER);

    cp5.addRadio("fluid_displayVelocityVectors").setGroup(group_fluid).setSize(18, 18).setPosition(px, py+=(int)(oy*2.5f))
      .setSpacingColumn(2).setSpacingRow(2).setItemsPerRow(1)
      .addItem("Velocity Vectors", 0)
      .activate(DISPLAY_FLUID_VECTORS ? 0 : 2);
  }



  ////////////////////////////////////////////////////////////////////////////
  // GUI - OPTICAL FLOW
  ////////////////////////////////////////////////////////////////////////////
  Group group_oflow = cp5.addGroup("Optical Flow");
  {
    group_oflow.setSize(gui_w, 165).setHeight(20)
      .setBackgroundColor(color(16, 180)).setColorBackground(color(16, 180));
    group_oflow.getCaptionLabel().align(CENTER, CENTER);

    px = 10; 
    py = 15;

    cp5.addSlider("blur input").setGroup(group_oflow).setSize(sx, sy).setPosition(px, py)
      .setRange(0, 30).setValue(opticalflow.param.blur_input).plugTo(opticalflow.param, "blur_input");

    cp5.addSlider("blur flow").setGroup(group_oflow).setSize(sx, sy).setPosition(px, py+=oy)
      .setRange(0, 10).setValue(opticalflow.param.blur_flow).plugTo(opticalflow.param, "blur_flow");

    cp5.addSlider("temporal smooth").setGroup(group_oflow).setSize(sx, sy).setPosition(px, py+=oy)
      .setRange(0, 1).setValue(opticalflow.param.temporal_smoothing).plugTo(opticalflow.param, "temporal_smoothing");

    cp5.addSlider("flow scale").setGroup(group_oflow).setSize(sx, sy).setPosition(px, py+=oy)
      .setRange(0, 200f).setValue(opticalflow.param.flow_scale).plugTo(opticalflow.param, "flow_scale");

    cp5.addSlider("threshold").setGroup(group_oflow).setSize(sx, sy).setPosition(px, py+=oy)
      .setRange(0, 3.0f).setValue(opticalflow.param.threshold).plugTo(opticalflow.param, "threshold");

    cp5.addRadio("opticalFlow_setDisplayMode").setGroup(group_oflow).setSize(18, 18).setPosition(px, py+=oy)
      .setSpacingColumn(40).setSpacingRow(2).setItemsPerRow(3)
      .addItem("dir", 0)
      .addItem("normal", 1)
      .addItem("Shading", 2)
      .activate(opticalflow.param.display_mode);
  }



  ////////////////////////////////////////////////////////////////////////////
  // GUI - DISPLAY
  ////////////////////////////////////////////////////////////////////////////
  Group group_display = cp5.addGroup("display");
  {
    group_display.setHeight(20).setSize(gui_w, 175)
      .setBackgroundColor(color(16, 180)).setColorBackground(color(16, 180));
    group_display.getCaptionLabel().align(CENTER, CENTER);

    px = 10; 
    py = 15;

    cp5.addSlider("BACKGROUND").setGroup(group_display).setSize(sx, sy).setPosition(px, py)
      .setRange(0, 255).setValue(BACKGROUND_COLOR).plugTo(this, "BACKGROUND_COLOR");

    cp5.addCheckBox("setOptionsGeneral").setGroup(group_display).setSize(38, 18).setPosition(px, py+=oy)
      .setItemsPerRow(1).setSpacingColumn(3).setSpacingRow(3)
      .addItem("display source", 0).activate(DISPLAY_SOURCE ? 0 : 100);

    cp5.addCheckBox("activeFilters").setGroup(group_display).setSize(18, 18).setPosition(px, py+=(int)(oy*1.5f))
      .setItemsPerRow(1).setSpacingColumn(3).setSpacingRow(3)
      .addItem("grayscale", 0).activate(APPLY_GRAYSCALE ? 0 : 100)
      .addItem("bilateral filter", 1).activate(APPLY_BILATERAL ? 1 : 100);

    cp5.addRadio("setAddDensityMode").setGroup(group_display).setSize(18, 18).setPosition(px, py+=(int)(oy*2.5f))
      .setSpacingColumn(2).setSpacingRow(2).setItemsPerRow(1)
      .addItem("color", 0)
      .addItem("camera", 1)
      .activate(ADD_DENSITY_MODE);
  }


  ////////////////////////////////////////////////////////////////////////////
  // GUI - ACCORDION
  ////////////////////////////////////////////////////////////////////////////
  cp5.addAccordion("acc").setPosition(gui_x, gui_y).setWidth(gui_w).setSize(gui_w, height)
    .setCollapseMode(Accordion.MULTI)
    .addItem(group_fluid)
    .addItem(group_oflow)
    .addItem(group_display)
    .open(0, 1, 2);
}
