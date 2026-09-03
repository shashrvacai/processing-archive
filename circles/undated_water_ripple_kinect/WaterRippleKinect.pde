import org.openkinect.processing.*;

PGraphics2D  Kanvas;
Kinect2 K ;   // k in the kinect object
int dMax=  1250, dMin = 280 ;    // depth of the kinect
int w, h ;    
PImage g ;

int count = 0 ;

int cols;
int rows;
float[][] current;// = new float[cols][rows];
float[][] previous;// = new float[cols][rows];
float counter= 0 ;
float dampening = 0.99;

void setup() {
  //fullScreen(P2D);
  size(1280, 720, P2D);
  surface.setResizable(true);
  K = new Kinect2(this);
  K.initDepth();  // int depth ; 
  K.initVideo();
  K.initRegistered();
  K.initDevice();
  
  cols = width;
  rows = height;
  current = new float[cols][rows];
  previous = new float[cols][rows];

  Kanvas = (PGraphics2D)createGraphics(width, height, P2D);
}

void draw() {
  Kanvas.beginDraw();

  PImage dep =  K.getRegisteredImage();
  // println(g.width, g.height, dep.width, dep.height);

  int[]  Rdep = K.getRawDepth();
  noStroke();
  
   float skip = 1 ;
  for (int x = 0; x < dep.width; x+=skip) {
    for (int y = 0; y < dep.height; y+=skip) {
      
      int  i = x + y* dep.width;    // index 
      int d = Rdep[i];   // depth index
      float X = map(x, 0, dep.width, 0, width);
      float Y = map(y, 0, dep.height, 0, height);

      if (d >dMin && d <dMax) {
        pushMatrix(); 
        if (count%10==0) { 
        previous[(int)X][(int)Y]=250;
        }
        popMatrix();
      }
    }
  }
  Kanvas.endDraw();
  

  
  if (count%100==0) {    // frequency of the water drops 
  pushMatrix();
  scale(1.5);
  image(Kanvas,0,0,width,height);
  popMatrix();
  }
  
  
  
  loadPixels();
  for (int i = 1; i < cols-1; i++) {
    for (int j = 1; j < rows-1; j++) {
      current[i][j] = (
        previous[i-1][j] + 
        previous[i+1][j] +
        previous[i][j-1] + 
        previous[i][j+1]) / 2 -
        current[i][j];
      current[i][j] = current[i][j] * dampening;
      int index = i + j * cols;
      pixels[index] = color(current[i][j]);
    }
  }
  updatePixels();

  float[][] temp = previous;
  previous = current;
  current = temp;
  
  count++ ;
}
