import processing.video.*;
Particle[] particles;

Capture grab;
PImage Buffer ;

color black = color(0);
color white = color(255);
int numPixels;

void setup() {
  size(1280, 720);
  surface.setResizable(true);

  grab = new Capture(this, 640, 360);
  grab.start();
  Buffer=  new PImage(grab.width, grab.height);
  
  numPixels = grab.width * grab.height;
  noCursor();
  smooth();
  
  particles = new Particle [16500];
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
  background(0);
}

//void captureEvent(Capture video) {
//  video.read();
//}

void draw() {
   if (grab.available()) {
    grab.read();
    grab.loadPixels();
    int threshold =70;  // ----------------------------------------------------------------Set the threshold value
    float pixelBrightness; // Declare variable to store a pixel's color
    // Turn each pixel in the video frame black or white depending on its brightness
    loadPixels();
    for (int i = 0; i < numPixels; i++) {
      pixelBrightness = brightness(grab.pixels[i]);
      if (pixelBrightness > threshold) { // If the pixel is brighter than the
        Buffer.pixels[i] = white; // threshold value, make it white
      } else { // Otherwise,
        Buffer.pixels[i] = black; // make it black
      }
    }
    updatePixels();
  }
  
  

  for (int i = 0; i < particles.length; i++) {
    particles[i].display();
    particles[i].move();
  }
}
