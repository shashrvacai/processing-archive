PS ps ;

void setup(){
  size(650,400);
  ps = new PS(new PVector(width/2, height/2));
}
void draw(){
  background(255);
  ps.addParticle();
  ps.run();
}

void mousePressed(){
  ps = new PS(new PVector(mouseX, mouseY));
}
