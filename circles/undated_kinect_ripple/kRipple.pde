import gab.opencv.*;
import KinectPV2.*;

KinectPV2 kinect;
OpenCV opencv;

int cols;
int rows;
float[][] current;// = new float[cols][rows];
float[][] previous;// = new float[cols][rows];
float x = 200, y=200, a , r = 200;
float dampening = 0.99;

PGraphics2D  K ,g ;
float polygonFactor = 1;
int threshold = 10;
//Distance in cm
int maxD = 1000; //4.5m
int minD = 500; //50cm

boolean    contourBodyIndex = false;

void setup() {
  size(1386, 786, P3D);

  K = (PGraphics2D)createGraphics(width, height, P2D);
  opencv = new OpenCV(this, 512, 424);
  kinect = new KinectPV2(this);

  kinect.enableDepthImg(true);
  kinect.enableBodyTrackImg(true);
  kinect.enablePointCloud(true);

  kinect.init();
  
  cols = width;
  rows = height;
  current = new float[cols][rows];
  previous = new float[cols][rows];
}

void draw() {
  background(0);
  noFill();
  strokeWeight(3);
  //change contour extraction from bodyIndexImg or to Depth
  if (contourBodyIndex)  { 
    image(kinect.getBodyTrackImage(), 512, 424);
  }

  if (contourBodyIndex) {
   // opencv.loadImage(kinect.getBodyTrackImage());
   // opencv.gray();
   // opencv.threshold(threshold);
   //PImage dst = opencv.getOutput();
  } else {
    opencv.loadImage(kinect.getPointCloudDepthImage());
    opencv.gray();
    opencv.threshold(threshold);
    PImage dst = opencv.getOutput();
  }

   pushMatrix();
  K.beginDraw();
 
  ArrayList<Contour> contours = opencv.findContours(false, false);
  if (contours.size() > 0) {
    for (Contour contour : contours) {
      contour.setPolygonApproximationFactor(polygonFactor);
      if (contour.numPoints() > 50) {
        K.background(0);
         K.noFill();
       // K.stroke(0, 200, 200);
        K.beginShape();
         
        for (PVector point : contour.getPolygonApproximation ().getPoints()) {
            pushMatrix();
            K.scale(2);
          //K.vertex(point.x, point.y);
            previous[width/6+int(point.x*2)][int(point.y*1.8)] =700;
            popMatrix();
        }
        K.endShape();
      }
    }
  }  
  K.endDraw();
  popMatrix();

  
  //image(K,0,0);
 

  

 


  
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
  //L.endDraw();
  
  kinect.setLowThresholdPC(minD);
  kinect.setHighThresholdPC(maxD);
  
a+= 0.1 ;
  
}


void keyPressed() {
  //change contour finder from contour body to depth-PC
  if ( key == 'b') {
    contourBodyIndex = !contourBodyIndex;
    if (contourBodyIndex)
      threshold = 200;
    else
      threshold = 40;
  }

  if (key == 'a') {
    threshold+=1;
  }
  if (key == 's') {
    threshold-=1;
  }

  if (key == '1') {
    minD += 10;
  }

  if (key == '2') {
    minD -= 10;
  }

  if (key == '3') {
    maxD += 10;
  }

  if (key == '4') {
    maxD -= 10;
  }

  if (key == '5')
    polygonFactor += 0.1;

  if (key == '6')
    polygonFactor -= 0.1;
}
