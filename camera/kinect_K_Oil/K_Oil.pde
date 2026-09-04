import org.openkinect.processing.*;
import java.util.Arrays;
float[][] z, v, a;

PGraphics2D  Kanvas;
Kinect2 K ;   // k in the kinect object
int dMax=  1250, dMin = 280 ;    // depth of the kinect
int w, h ;    
PImage g ;

int count = 0 ;

void setup() {
  size(1280, 720, P2D);
  surface.setResizable(true);

  colorMode(RGB, 1);
  z = new float[width][height];
  v = new float[width][height];
  a = new float[width][height];
  loadPixels();

  K = new Kinect2(this);
  K.initDepth();  // int depth ; 
  K.initVideo();
  K.initRegistered();
  K.initDevice();

  Kanvas = (PGraphics2D)createGraphics(width, height, P2D);
}

void draw() {
  Kanvas.beginDraw();
  pushMatrix();
  Kanvas.fill(255, 100);
// if(mousePressed) {Kanvas.rect(0, 0, width, height); }
  Kanvas.noFill();
  popMatrix();
  Dkinect();
  Kanvas.endDraw();

  pushMatrix();

  scale(2);

  if (count %1==0) {
    image(Kanvas, 0, 0, width, height);
  }
  popMatrix();

  for (int x = 1; x < width-1; x++) {
    for (int y = 1; y < height-1; y++) {
      a[x][y] = (v[x-1][y] + v[x+1][y] + v[x][y-1] + v[x][y+1])/4 - v[x][y];
    }
  }
  for (int x = 1; x < width-1; x++) {
    for (int y = 1; y < height-1; y++) {
      v[x][y] += a[x][y];
      z[x][y] += v[x][y];
      pixels[width*y+x] = color(sin(z[x][y]) + 1, cos(z[x][y]), 1);
    }
  }
  updatePixels();
  count++ ;
}

void move(int x_, int y_) {
  if (x_ > -1    &&    y_ < width    &&    y_ > -1    &&    y_ < height) {
    v[x_][y_] = randomGaussian() * TAU;
  }
}
