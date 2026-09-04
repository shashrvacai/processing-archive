import processing.sound.*;
//import spout.*;

float nx = 0;
float ny = 0;
float nz = 0;

//Spout spout;

Amplitude  amp ;
AudioIn in ;

void setup () {
    //spout = new Spout(this);

  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in. start();
  amp.input(in);
  
  size (600, 1000);
  //colorMode (HSB);
  
   background (0);
}


void draw () {
  float aa =  amp.analyze();
   
   fill(0,5);
   rect(0,0,width,height);
   noFill();
   
 
  strokeWeight(2);
  
  float sw = map(aa,0,1,0,155);
  stroke (255-sw);
  fill(sw);
  drawStream (aa);
}

void drawStream (float aa_) {
  nx = 0;
  for (int i=0; i<width; i += 70) {
    ny = 0;
    for (int j=0; j<height; j += 10) {
      float n = noise (nx, ny, nz);
      float angle = map (n, 0, 1.0, 0, 12*PI);
      float x = 70 * cos (angle);
      float y = 40 * sin (angle);
      //line (i, j, i+x, j+y);
      ellipse(i+x, j+y,10,10);
      ny += 0.02;
    }
    nx += 0.05;
  }
  nz +=aa_/10;
}
