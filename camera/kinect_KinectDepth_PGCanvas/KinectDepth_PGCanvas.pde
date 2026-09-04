import org.openkinect.processing.*;

PGraphics2D  Kanvas;
Kinect2 K ;   // k in the kinect object
int dMax=  1250, dMin = 280 ;    // depth of the kinect
int w, h ;    
PImage g ;

int count = 0 ;

void setup() {
  size(1280, 720, P2D);
  surface.setResizable(true);
  K = new Kinect2(this);
  K.initDepth();  // int depth ; 
  K.initVideo();
  K.initRegistered();
  K.initDevice();

  Kanvas = (PGraphics2D)createGraphics(width, height, P2D);
}

void draw() {
  Kanvas.beginDraw();
  Dkinect();
  Kanvas.endDraw();
  
  pushMatrix();

  scale(2);

  if(count %1==0){
  image(Kanvas,0,0,width,height);
  }
  
  popMatrix();
  count++ ;
}
