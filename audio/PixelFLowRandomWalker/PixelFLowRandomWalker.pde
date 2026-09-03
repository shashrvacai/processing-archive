import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.fluid.DwFluid2D;
import processing.sound.*;

Amplitude amp ;
AudioIn in;


PVector pos, nOff ;

// fluid simulation
DwFluid2D fluid;

// render target
PGraphics2D pg_fluid;

public void setup() {
  size(800, 800, P2D);
  
  amp = new Amplitude(this);
  in  = new AudioIn(this,0);
  in.start();
  amp.input(in); 
  
  pos = new PVector(width/2,height/2);
  nOff = new PVector(random(10000),random(1000));
  // library context
  DwPixelFlow context = new DwPixelFlow(this);

  // fluid simulation
  fluid = new DwFluid2D(context, width, height, 1);
  pg_fluid = (PGraphics2D) createGraphics(width, height, P2D);
}



public void draw() {  
  
  float a = amp.analyze()*10;
  
  pos.x = map(noise(nOff.x),0,1,0,width);
  pos.y = map(noise(nOff.y),0,1,0,height);
  nOff.add(0.01,0.01,0);
   //ellipse(pos.x, pos.y, 48, 48);
  
  // update simulation
  fluid.update();
     // some fluid parameters
  fluid.param.dissipation_velocity = a;
  fluid.param.dissipation_density  = 1f;

  // adding data to the fluid simulation
  fluid.addCallback_FluiData(new  DwFluid2D.FluidData() {
    public void update(DwFluid2D fluid) {
      {
        float px     = pos.x;
        float py     = height-pos.y;
        float vx     = 170;
        float vy     = 170;
        fluid.addVelocity(px, py, 14, vx, vy);
        fluid.addDensity (px, py, 20, random(1), random(1), random(1), random(1));
        fluid.addDensity (px, py, 20, 0.2f, 0.5f, 0.8f, random(2));
      }
    }
  });





  // clear render target
  pg_fluid.beginDraw();
  pg_fluid.background(0);
  pg_fluid.endDraw();

  // render fluid stuff
  fluid.renderFluidTextures(pg_fluid, 0);

  // display
  image(pg_fluid, 0, 0);
}
