
import processing.sound.*;

Amplitude amp;
AudioIn in ;

float r = 35;
float nI = 0 ;
float sW = 5 ;  //// --- strokeWeight 
float Zrun = 0 ;
float Yrun = 0 ;
float Xrun = 0 ;

void setup() {

  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);


  size(800, 800, P3D);
  surface.setResizable(true);

  rectMode(CENTER);
  noiseDetail(1, 0.002);
}

void draw() {
  
  Zrun = map(mouseX, 0, width, 0,width);
   Yrun = map(mouseY, 0, height, 0,height);
  camera(70.0, Yrun,Zrun, width/2, height/2,  0.0, 
       0.0, 1.0, 0.0);
  background(0);

  float aa = amp.analyze();

  for (float x =r; x < width; x+=r) {
    for (float y =r; y < height; y+=r) {
      for (float z =r; z < 300; z+=4*r) {


        float n = noise(x+nI, y+nI, z+nI);
        pushMatrix();
        float rA = map(aa, 0, 0.3, -TWO_PI, TWO_PI);
        float rB = map(aa, 0, 0.3, -PI, PI);
        translate(x, y, z);

        rotateY(rA*n);
        rotateX(-rB*n);
        rotateZ(-rA*n);
        fill(0);
        stroke(255);
        
        rect(0, 0, r/2, r/2);
          pushMatrix();
          rotateX(PI/2);
          fill(255);
          stroke(0);
          rect(0, 0, r/2, r/2);
            
          popMatrix();
        popMatrix();
      }
    }
  }


  nI+=0.001;
}