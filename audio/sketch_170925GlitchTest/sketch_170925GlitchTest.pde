GlitchObject myGlitch;
boolean glitch = true;
PImage img;
float w , h ;

void setup() {
  img = loadImage("02.jpg");
  size(1000, 1000);
  myGlitch = new GlitchObject();
  h = random(height);
  w = random(width);
}

void draw() {
  background(0);
  image(img,0,0);
  rect(h,w,100,100);
  if(mouseX > width/2){
  if (glitch) { myGlitch.run(); }
}
}

void mousePressed() {
  glitch = !glitch;
}