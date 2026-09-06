float t; 
void setup() {
  size(300, 200);
}

void draw() {
  background(255);
  t = map(mouseX, 0, width, 0, PI/2);
  translate(width/2,height);
  stroke(0);
  branch(60);
}

void branch(float l_) {
  float sw = map(l_, 2, 120, 1, 10);
  strokeWeight(sw);

  line(0, 0, 0, -l_);
  translate(0, -l_);
  l_*=0.6;
  if (l_>2) {
    pushMatrix();
      rotate(t);
      branch(l_);
    popMatrix();
    pushMatrix();
      rotate(-t);
      branch(l_);
    popMatrix();
  }
}