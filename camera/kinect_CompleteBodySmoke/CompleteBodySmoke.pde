import org.openkinect.processing.*;
import processing.sound.*;

Kinect2 K ;   // k in the kinect object
ParticleSystem ps;

Amplitude amp ;
AudioIn in ;

PImage tex;
boolean R = false ;
float dMin = 1012 ;
float dMax = 1600 ;

void setup() {
  size(1536, 1272);
  surface.setResizable(true);
  K = new Kinect2(this);

  K.initDepth();  // int depth ; 
  K.initDevice();

  tex = loadImage("texture.png");
  ps = new ParticleSystem(new PVector(width/2, 50));
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);  
  in.start();
  amp.input(in);
}

void draw() {
  float a = amp.analyze();
  float dx = map(a, 0, 0.05, -0.1, 0.1);   // map value
  PVector w = new PVector(0,dx);
  scale(2);
  background(0);

  PImage dep =  K.getDepthImage();  // depth img
  //image(dep,0,0);   // test depth image
  int[]  Rdep = K.getRawDepth();

  float sX = 0 ;   /// sum of X 
  float sY = 0 ;   /// sum of Y
  float tP = 0 ;   /// total number of pixels 

  float s = 5;    // skip
  float r = 20;    // range
  for (int x = 0; x < dep.width; x+=s) {
    for (int y = 0; y < dep.height; y+=s) {
      int  i = x + y* dep.width;    // index 
      float b = brightness(dep.pixels[i]);  
      int d = Rdep[i];   // depth index
      float n = map(d, dMin, dMax, 10, 255);
      float si = map(n, 0, 255, s*r, s/r);
      //float si = map(n, 0, 255, s*r, s/r);   ///reverse

      float m = map(b, 0, 255, 8, 50); // mapping brightness values 

      if (d >dMin && d <dMax) {

        fill(255, 255-n, n, 255);   // pink to orange
        noStroke();
        //ellipse(x, y, si, si);
        for (int j = 0; j < 1; j++) {
          ps.addParticle(x, y, tex);
        }
        ps.run();
        sX += x ;
        sY += y ;
        tP ++ ;
      } else {
      }
    }
  }
  ps.aF(w);
  ps.run();
  float aX = sX /tP ;
  float aY = sY /tP ;
  fill(125);
  // ellipse(aX, aY, 20, 20);  // mean pointer // emittor
}
