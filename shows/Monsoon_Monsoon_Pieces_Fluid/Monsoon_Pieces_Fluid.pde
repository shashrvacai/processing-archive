import com.thomasdiewald.pixelflow.java.DwPixelFlow; //<>//
import com.thomasdiewald.pixelflow.java.dwgl.DwGLSLProgram;
import com.thomasdiewald.pixelflow.java.fluid.DwFluid2D;
import com.thomasdiewald.pixelflow.java.imageprocessing.DwOpticalFlow;
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.DwFilter;
import processing.core.*;
import processing.opengl.PGraphics2D;

import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

private class MyFluidData implements DwFluid2D.FluidData{
   
    @Override
    // this is called during the fluid-simulation update step.
    public void update(DwFluid2D fluid) {    
      float px, py, vx, vy, radius, vscale;
      boolean mouse_input =  mousePressed;
      if(mouse_input ){        
        vscale = 15;
        px     = mouseX;
        py     = height-mouseY;
        vx     = (mouseX - pmouseX) * +vscale;
        vy     = (mouseY - pmouseY) * -vscale;
       
        if(mouseButton == LEFT){
          radius = 20;
          fluid.addVelocity(px, py, radius, vx, vy);
        }
        if(mouseButton == CENTER){
          radius = 50;
          fluid.addDensity (px, py, radius, 1.0f, 0.0f, 0.40f, 1f, 1);
        }
        if(mouseButton == RIGHT){
          radius = 15;
          fluid.addTemperature(px, py, radius, 15f);
        }
        
      }
      // use the text as input for density
      if(ADD_DENSITY_MODE == 0) addDensityTexture (fluid, opticalflow);
      if(ADD_DENSITY_MODE == 1) addDensityTexture_cam(fluid, opticalflow);      
      addVelocityTexture(fluid, opticalflow);
      
    }    
  }
  
  
  int view_w = 1386;
  int view_h =768;
  
  int fluidgrid_scale = 2;      // grid size 
  
  DwPixelFlow context;          // main library context
  DwFilter filter;              // collection of imageprocessing filters
  DwFluid2D fluid;              // fluid solver
  MyFluidData cb_fluid_data;
  DwOpticalFlow opticalflow;      // optical flow
  PGraphics2D pg_cam_a;      // buffer for the capture-image
  PGraphics2D pg_fluid;            // offscreen render-target for fluid  
       
  int     BACKGROUND_COLOR = 255;
  boolean DISPLAY_SOURCE   = true;
  boolean APPLY_BILATERAL  = true;

  boolean DISPLAY_FLUID_TEXTURES  = true;
  
  int     DISPLAY_fluid_texture_mode = 0;
  
  int     ADD_DENSITY_MODE = 1;

int dMax=  2700, dMin = 250 , rX3, rW3, rW2, rX2, rX1, rW1,rX4,rW4,rX5,rW5;
int bX3, bW3, bW2, bX2, bX1, bW1, bW4 ,bX4 , bW5, bX5 ;
Kinect2 kinect2;
PImage g ,v  ;
PGraphics2D  K , Kanvas;

  public void settings() {
    size(view_w , view_h, P2D);
    smooth(4);
  }

void setup() {
      context = new DwPixelFlow(this);       // main library context    
    filter = new DwFilter(context);
    fluid = new DwFluid2D(context, view_w, view_h, fluidgrid_scale);       // fluid object

    cb_fluid_data = new MyFluidData();                         // calback for adding fluid data
    fluid.addCallback_FluiData(cb_fluid_data);

    opticalflow = new DwOpticalFlow(context, width, height);         // optical flow object      
    opticalflow.param.display_mode = 1;           // optical flow parameters  
  
    // render buffers
    pg_cam_a = (PGraphics2D) createGraphics(width, height, P2D);
    
    pg_fluid = (PGraphics2D) createGraphics(view_w, view_h, P2D);
    pg_fluid.smooth(4);

    background(255);
    frameRate(60);
  
  
  kinect2 = new Kinect2(this);
  kinect2.initVideo();
  kinect2.initDepth();
  kinect2.initRegistered();
  // Start all data
  kinect2.initDevice();

  Kanvas = (PGraphics2D)createGraphics(width, height, P2D);
  K = (PGraphics2D)createGraphics(width, height, P2D);
  
    rX1 = 300;     rW1=200;
    rX2 = rX1+rW1; rW2 =200;
    rX3 = rX2+rW2; rW3=200 ;
    rX4 = rX3+rW3; rW4 =200;
    rX5 = rX4+rW4; rW5 = 200 ; 
      
    bX1 = 0 ;     bW1 = 300 ;
    bX2 = bX1+bW1 ; bW2 =200 ;
    bX3 = bX2+bW2 ; bW3 = 300 ;
    bX4 = bX3+bW3 ; bW4 = 300 ;
    bX5 = bX4+bW4 ; bW5 = 285; 
}

void draw() {
     // some fluid parameters
    fluid.param.dissipation_density     = 1.0f;
    fluid.param.dissipation_velocity    = 0.20f;
    fluid.param.dissipation_temperature = 0.10f;
    fluid.param.vorticity               = 0.10f;
    fluid.param.timestep                =  0.12 ;
    fluid.param.num_jacobi_projection =  7 ;
    opticalflow.param.blur_input   =  0; 
    opticalflow.param.blur_flow    =  0 ;
    opticalflow.param.temporal_smoothing  =  0.5 ;
    opticalflow.param.flow_scale   =  50 ;
    opticalflow.param.threshold   = 1.5 ;
  
 // background(0);
  //println(K.width,K.height);
  pushMatrix();
  K.beginDraw();
  fill(0);
  rect(0,0,width,height);
  translate(0,-100);
  scale(2.7);
  Dkinect();
  K.endDraw();
  popMatrix();

  Kanvas.beginDraw();
  Cdraw();
  Kanvas.endDraw();
  

 image(K,0,0); 
 
      swapCamBuffer(); // "pg_cam_a" has the image now
      
      if(APPLY_BILATERAL){
        filter.bilateral.apply(pg_cam_a, K, 5, 0.10f, 4);
        swapCamBuffer();
      }            
      opticalflow.update(pg_cam_a);  // update Optical Flow     
    
      fluid.update();                     // updates fluid ..   
 
    pg_fluid.beginDraw();                     // render everything
    //pg_fluid.background(BACKGROUND_COLOR);
    if(DISPLAY_SOURCE && ADD_DENSITY_MODE == 0){
      pg_fluid.image(pg_cam_a, 0, 0, view_w, view_h);
    }
    pg_fluid.endDraw();
 
    fluid.renderFluidTextures(pg_fluid, DISPLAY_fluid_texture_mode);    // add fluid stuff to rendering
      
    background(255);             // display result
    image(pg_fluid, 0, 0);    
}

  void swapCamBuffer(){                             // swapping function 
    PGraphics2D tmp = pg_cam_a;
    pg_cam_a = K;
    K = tmp;
  }
