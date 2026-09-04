import org.openkinect.processing.*; //<>//
import processing.sound.*;

ParticleSystem ps;

Amplitude amp ;
AudioIn in ;

// Kinect Library object
Kinect2 kinect2;

float minThresh = 880;
float maxThresh = 1430;
PImage img;
PImage tex;
int jump = 3 ;

void setup() {
  size(1028, 848);
  kinect2 = new Kinect2(this);
  kinect2.initDepth();
  kinect2.initDevice();
  img = createImage(kinect2.depthWidth, kinect2.depthHeight, RGB);
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
  PVector w = new PVector(0, -dx);
  //translate(width,height);
  //rotate(PI);
  scale(2);

  background(0);

  img.loadPixels();

  //minThresh = map(mouseX, 0, width, 0, 4500);
  //maxThresh = map(mouseY, 0, height, 0, 4500);

  // Get the raw depth as array of integers
  int[] depth = kinect2.getRawDepth();

  float sumX = 0;
  float sumY = 0;
  float totalPixels = 0;

  for (int x = 0; x < kinect2.depthWidth; x+= jump) {
    for (int y = 0; y < kinect2.depthHeight; y+= jump) {
      int offset = x + y * kinect2.depthWidth;
      int d = depth[offset];

      if (d > minThresh && d < maxThresh && x > 100) {
        img.pixels[offset] = color(255, 0, 150);

        sumX += x;
        sumY += y;
        totalPixels++;
      } else {
        img.pixels[offset] = color(0);
      }
    }
  }

  img.updatePixels();
  imageMode(CORNER);
  image(img, 0, 0);

  float avgX = sumX / totalPixels;
  float avgY = sumY / totalPixels;
  //fill(150, 0, 255);
  //ellipse(avgX, avgY, 64, 64);

  for (int i = 0; i < 1; i++) {
    ps.addParticle(avgX, avgY, tex);
  }
  ps.aF(w);
  ps.run();
}
