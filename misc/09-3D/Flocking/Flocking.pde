
import processing.opengl.*;
import toxi.processing.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.math.*;

int DIM = 400;
int NUM = 1200;
int NEIGHBOR_DIST = 50;
int SEPARATION = 25;
float BOID_SIZE = 5;

Flock flock;

Matrix4x4 colorMatrix=new Matrix4x4().scale(255f/(DIM*2)).translate(DIM,DIM,DIM);

ToxiclibsSupport gfx;

void setup() {
  size(1024,576,OPENGL);
   gfx=new ToxiclibsSupport(this);
  flock = new Flock();
  for (int i = 0; i < NUM; i++) {
    flock.addBoid(new Boid(new Vec3D(), 3, 0.05, NEIGHBOR_DIST, SEPARATION));
  }
  smooth();
}

void draw() {
  pushMatrix();
  rectMode(CENTER);
  translate(0,0,-width/2);
  fill(0,10);
  rect(0,0,width*3, height*3);
  popMatrix();
  translate(width/2,height/2,-200);
  rotateY(mouseX*0.01);
  flock.run();
}

void mousePressed() {
  flock.addBoid(new Boid(new Vec3D(), 3, 0.05, NEIGHBOR_DIST, SEPARATION));
}
