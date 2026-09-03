GlitchObject myGlitch;
boolean glitch = true;
PImage img;

void setup() {
  img = loadImage("02.jpg");
  size(1000, 1000);
  myGlitch = new GlitchObject();
}

void draw() {
  background(img);
  if (glitch) { myGlitch.run(); }
}

void mousePressed() {
  glitch = !glitch;
}