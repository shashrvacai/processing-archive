import megamu.mesh.*;
import processing.video.*;

Capture cam;
PImage[] images;
PImage image;
int seed, x, y, p;
int particles = 10000;
float power, mvalue, ratio, posx, posy, deltaX, deltaY, tStep;
float startX, startY, endX, endY;
float[][] points;
Delaunay myDelaunay;
float[][] myEdges;
color c1, c2;
boolean re, colorMode = true, drawDelaunay, lightMode, showGui = false;
int A = 0; 

void setup() {
  size(1280, 720, P2D);
  pixelDensity(2);
  //noLoop();
  power = 1;
  particles = 10000;

  images = new PImage[7];
  for (int i=0; i< images.length; i++) {
    images[i] = loadImage("source"+i+".jpg");
    images[i].loadPixels();
  }
  image = images[0];


  cam = new Capture(this);
  cam.start();
}


void draw() {

  if (cam.available() == true) {
    cam.read();
  }
  //image(cam, 0, 0, 450, 280);
  drawDelaunay = true;
  if (re == true) {
    re = false;   
    particles = (int)1000; // between 100 to 10000 
    power = 3;  // between 0,10
    ratio = min(float(width-50)/(float)cam.width, float(height-50)/ (float)cam.height);
    posx = (width-cam.width*ratio)/2;
    posy = (height-cam.height*ratio)/2;

    background(0);
    noFill();
    noStroke();


    points = new float[particles][2];
    while (particles > 0) {
      x = (int)random(cam.width);
      y = (int)random(cam.height);
      p = x+y*cam.width;
      mvalue = map(brightness(image.pixels[p]), 0, 255, 1, 0);


      if (!drawDelaunay) {
        fill(255);
      }
      boolean condition;
      if (lightMode) {
        condition = random(1.0) < pow(mvalue, power);
      } else {
        condition = random(1.0) < pow(1 - mvalue, power);
      }


      if (condition) {
        particles--;
        points[particles][0] = x;
        points[particles][1] = y;

        if (!drawDelaunay) {
          if (colorMode) {
            fill(cam.get(x, y));
          }
          ellipse(posx+x*ratio, posy+y*ratio, 2, 2);
        }
      }
    }

    if (drawDelaunay) {
      myDelaunay = new Delaunay( points );
      myEdges = myDelaunay.getEdges();
      for (int i=0; i<myEdges.length; i++)
      {

        startX = posx + myEdges[i][0]* ratio;
        startY = posy + myEdges[i][1]*ratio;
        endX = posx + myEdges[i][2]* ratio;
        endY = posy + myEdges[i][3]* ratio;

        c1 = cam.get((int)myEdges[i][0], (int)myEdges[i][1]);
        c2 = cam.get((int)myEdges[i][2], (int)myEdges[i][3]);
        gradientLine( startX, startY, endX, endY, c1, c2 );
      }
    }
  }

  seed = (int)A;
  randomSeed(seed);
  re = true;

  if (A > 10000) {  
    A ++ ;
  } else {
    A -- ;
  }
}

void gradientLine(float x1, float y1, float x2, float y2, color a, color b) {
  deltaX = x2-x1;
  deltaY = y2-y1;
  tStep = 1.0/dist(x1, y1, x2, y2);
  for (float t = 0.0; t < 1.0; t += tStep) {
    fill(lerpColor(a, b, t));
    ellipse(x1+t*deltaX, y1+t*deltaY, 1, 1);
  }
}
