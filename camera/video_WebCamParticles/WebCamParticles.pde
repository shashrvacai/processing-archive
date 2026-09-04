import processing.video.*;
Particle[] particles;

//PImage frog;
Capture grab;

void setup() {
  size(1280, 720);
  surface.setResizable(true);

  grab = new Capture(this, 640, 360);
  grab.start();
  particles = new Particle [16500];
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
  background(0);
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {

  for (int i = 0; i < particles.length; i++) {
    particles[i].display();
    particles[i].move();
  }
}