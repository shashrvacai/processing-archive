OpenSimplexNoise noise;
import processing.sound.*;
//import spout.*;

//Spout spout;

  Amplitude  amp ;
  AudioIn in ;
  
  PVector pos, nOff ;

void setup() {
  
  //spout = new Spout(this);
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in. start();
  amp.input(in);
  
  size(500, 500);
  surface.setResizable(true);
  noise = new OpenSimplexNoise();
  
  pos = new PVector(width/2,height/2);
  nOff = new PVector(random(10000),random(1000));
}

float sWt = 5.0 ; 
int spacing = 25;
int numFrames = 100;
float R = 0.5;
float scale = 0.01;

void draw() {
   //spout.sendTexture();
  float aa =  amp.analyze();
  
    pos.x = map(noise(nOff.x),0,1,0,width);
  pos.y = map(noise(nOff.y),0,1,0,height);
  nOff.add(aa,aa,0);
  
  float t = (0.5*frameCount/numFrames)%1;  // speed
  background(0);

  if (keyPressed) {
    if (key == 'q' || key == 'Q') {
      spacing ++;
    } else if (key == 'w' || key == 'W') {    
      spacing --;
    } else if (key == 'e' || key == 'E') {    
      sWt =5 ;
    } else if (key == 's' || key == 'S') {
      if (sWt > 1) {
        sWt -- ;
      } else {
        sWt = 1 ;
      }
    } else if (key == 'a' || key == 'A') {    
      sWt ++ ;
    }
  }
  stroke(255);
  strokeWeight(sWt);
  translate(width/2, height/2);
  for (int x = (-width/2); x<width/2; x+=spacing) {
    for (int y = (-height/2); y<height/2; y+=spacing) {
      float ns = (float)noise.eval(scale*x, scale*y, R*cos(TWO_PI*t), R*sin(TWO_PI*t));
      float ms = map(pos.x, 0, width, -0.7, 0.7);

      if (ns<ms) {
        line(x, y, x+spacing, y+spacing);
      } else {
        line(x, y+spacing, x+spacing, y);
      }
    }
  }
}
