import oscP5.*;
OscP5 oscP5;
import org.openkinect.processing.*;
Kinect2 K ;   // k in the kinect object



float dMin =1400 ;
float dMax = 1900 ;

// 'r' to clear the screen
// 'k' to pause/restart the simulation
// 'h' to show/hide the GUI

float er = 200 ;
float x;
float y;
float easing = 0.05;

import controlP5.*;

PGraphics canvas;
PShader grayscott, render;

PImage img;
PFont myFont;
PShader shader;

boolean effect = true;
boolean hideGUI = false;


float rDD1 =  1.0, rDD2 =  0.5, rDD3 =  0.0545, rDD4 =  0.062, rDD5 =  1.0, rDD6 =  4, rDD7 =  1.0, rDD8 =  0.5, rDD9 =  0.0545, rDD10 =  0.062, rDD11 =  1.0, rDD12 =  4, rDD13 =  1.0, rDD14 =  4;
float rDD15 = 15, rDD16 = 0.01 ;
int iterations = 1;

void setup() {
  noCursor();
  //fullScreen(1);
  oscP5 = new OscP5(this, 9600);   
  size(1920, 1080, P2D);


  grayscott = loadShader("grayscott.glsl");
  render = loadShader("render.glsl");
  canvas = createGraphics(width, height, P2D);
  canvas.beginDraw();
  canvas.background(255, 0, 0);
  canvas.stroke(200);
  canvas.endDraw();

  K = new Kinect2(this);
  K.initDepth();  // int depth ; 
  K.initDevice();
}

void draw() {
  render.set("ca", new PVector(rDD7, rDD8, rDD9));
  render.set("cb", new PVector(rDD11, rDD12, rDD13));
  canvas.strokeWeight(rDD15);
  grayscott.set("dA", rDD1);
  grayscott.set("dB", rDD2);
  grayscott.set("f", rDD3);
  grayscott.set("k", rDD4);
  grayscott.set("dt", rDD5);
  iterations= int(rDD6);


  canvas.beginDraw();

  pushMatrix();
  fill(0);
  rect(0, 0, width, height);
  noFill();
  popMatrix();

  PImage dep =  K.getDepthImage();  // depth img
  //image(dep,0,0);   // test depth image
  int[]  Rdep = K.getRawDepth();

  float sX = 0 ;   /// sum of X 
  float sY = 0 ;   /// sum of Y
  float tP = 0 ;   /// total number of pixels 

  float s = 10;    // skip
  float r = 5;    // range
  
    if (effect) {
    for (int i = 0; i < iterations; i++) {
      canvas.filter(grayscott);
    }
  }
  
  for (int x = 0; x < dep.width; x+=s) {
    for (int y = 0; y < dep.height; y+=s) {
      int  i = x + y* dep.width;    // index 
      float b = brightness(dep.pixels[i]);  
      int d = Rdep[i];   // depth index
      float n = map(d, dMin, dMax, 10, 255);
      //float si = map(n, 0, 255, s*r, s/r);
      float si = map(n, 0, 255, 0.5, 1);   ///reverse

      float m = map(b, 0, 255, 8, 50); // mapping brightness values 

      if (d >dMin && d <dMax) {

        fill(255, 255-n, n, 255);   // pink to orange
        noStroke();
        float X = map(x, 0, dep.width, 0, 1920);
        float Y = map(y, 0, dep.width, 0, 1380);
        canvas.ellipse(X, Y, si, si);
        sX += X ;
        sY += Y ;
        tP ++ ;
      } else {
      }
    }
  }

  float aX = sX /tP ;
  float aY = sY /tP ;


  fill(125);
 // canvas.ellipse(aX, aY, 20, 20);



  canvas.endDraw(); 

  image(canvas, 0, 0, width, height);
  filter(render);
}

void keyPressed() {
  if (key == 'r') {
    setup();
  }

  if (key == 'k') {
    effect = !effect;
  }
}
