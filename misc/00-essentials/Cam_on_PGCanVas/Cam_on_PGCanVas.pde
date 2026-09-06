
import processing.video.*; 
Capture cam; 

PGraphics canvas;


void setup() {
  size(1920, 1080, P2D);

  canvas = createGraphics(width, height, P2D);
  canvas.beginDraw();
  canvas.background(255, 0, 0);
  canvas.stroke(200);
  canvas.endDraw();

  cam = new Capture(this);
  cam.start();
}

void draw() {

  canvas.beginDraw();

  //  Background Blur
  pushMatrix();
  canvas.fill(0, 10);
  canvas.rect(0, 0, width, height);
  canvas.noFill();
  popMatrix();

  if (cam.available()) { 
    // Reads the new frame
    cam.read();
  } 

  canvas.image(cam, 0, 0);   
  canvas.endDraw();

  image(canvas, 0, 0, width, height);
}
