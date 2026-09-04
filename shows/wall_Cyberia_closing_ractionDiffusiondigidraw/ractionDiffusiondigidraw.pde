import oscP5.*;
OscP5 oscP5;

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
  myFont = createFont("MotoyaLMaru-W3-90ms-RKSJ-H", 175);
  textFont(myFont);
  textAlign(CENTER, CENTER);

  grayscott = loadShader("grayscott.glsl");
  render = loadShader("render.glsl");
  canvas = createGraphics(width, height, P2D);
  canvas.beginDraw();
  canvas.background(255, 0, 0);
  canvas.stroke(200);
  canvas.textFont(myFont);
  canvas.textAlign(CENTER, CENTER);
  canvas.endDraw();
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
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;

  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;

  if (effect) {
    for (int i = 0; i < iterations; i++) {
      canvas.filter(grayscott);
    }
  }
  //canvas.textSize(102);
  noFill();
  //canvas.ellipse(x, y, rDD16,rDD16);
  canvas.ellipse(x, y, rDD16, rDD16);
  //canvas.text("音楽", width/2, height/2);
  if (mousePressed) {
  }

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

  if (key == 's') {
    saveFrame("rda-###.png");
  }
}
