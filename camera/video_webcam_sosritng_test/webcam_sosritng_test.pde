import processing.video.*;
ArrayList<Particle> particles ;

Capture grab;
PImage Buffer ;

color black = color(0);
color white = color(255);
int numPixels;

void setup() {
  size(1280, 720);
  surface.setResizable(true);

  grab = new Capture(this, 1280, 720);
  grab.start();
  Buffer=  new PImage(grab.width, grab.height);

  numPixels = grab.width * grab.height;
  noCursor();
  smooth();

  // size(800, 800);
  particles = new ArrayList<Particle>();
}

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

  particles.add(new Particle(new PVector(mouseX, mouseY)));

  for (int i = particles.size()-1; i >= 0; i --) {
    Particle p = particles.get(i);
    p.run();
    if (p.isDead()) {
      particles.remove(i);
    }
  }
}
