
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.volume.*;
import toxi.math.noise.*;
import toxi.processing.*;

import processing.opengl.*;

import processing.sound.*;

Amplitude amp ;
AudioIn in;


int DIMX=192;
int DIMY=32;
int DIMZ=64;

float ISO_THRESHOLD = 0.1;
float NS=0.03;
float VS=0.5;
Vec3D SCALE=new Vec3D(3,0.5,1).scaleSelf(300);

IsoSurface surface;
TriangleMesh mesh;

boolean isWireframe=false;
float currScale=1;

ToxiclibsSupport gfx;

void setup() {
  size(1024,768,OPENGL);
  //hint(ENABLE_OPENGL_4X_SMOOTH);
  gfx=new ToxiclibsSupport(this);
  strokeWeight(0.5);
  
  amp = new Amplitude(this);
  in  = new AudioIn(this,0);
  in.start();
  amp.input(in); 
  
}

void draw() {
  float a = amp.analyze();
  
  VolumetricSpace volume=new VolumetricSpaceArray(SCALE,DIMX,DIMY,DIMZ);
  // fill volume with noise
  for(int z=0; z<DIMZ; z++) {
    for(int y=0; y<DIMY; y++) {
      for(int x=0; x<DIMX; x++) {
        volume.setVoxelAt(x,y,z,(float)SimplexNoise.noise(x*NS,y*NS,z*NS,VS)*0.5);
      } 
    } 
  }
  volume.closeSides();
  long t0=System.nanoTime();
  // store in IsoSurface and compute surface mesh for the given threshold value
  mesh=new TriangleMesh("iso");
  surface=new HashIsoSurface(volume,0.333333);
  surface.computeSurfaceMesh(mesh,ISO_THRESHOLD);
  
  VS += a ;
  
  
  background(128);
  translate(width/2,height/2,0);
  rotateX(mouseY*0.01);
  rotateY(mouseX*0.01);
  scale(currScale);
  ambientLight(48,48,48);
  lightSpecular(230,230,230);
  directionalLight(255,255,255,0,-0.5,-1);
  specular(255,255,255);
  shininess(16.0);
  beginShape(TRIANGLES);
  if (isWireframe) {
    stroke(255);
    noFill();
  } 
  else {
    noStroke();
    fill(255);
  }
  gfx.mesh(mesh);
}

void mousePressed() {
  isWireframe=!isWireframe;
}
void keyPressed() {
  if(key=='-') currScale=max(currScale-0.1,0.5);
  if(key=='=') currScale=min(currScale+0.1,10);
  if (key=='s') {
    // save mesh as STL or OBJ file
    mesh.saveAsSTL(sketchPath("noise.stl"));
  }
}