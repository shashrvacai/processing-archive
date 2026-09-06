int r = 20 ;
float a =0 ;

void setup() {
  size(600, 600);
  surface.setResizable(true);
}

void draw() {
  background(255);
  strokeWeight(r/10);
  translate(width , height/2);
  float y = height/2*sin(a);
  CCircles(0, y, r*5);
  CCircles(0, -y, r*5);
  a+=0.01;
}

void CCircles(float x_, float y_, int n_ ) {
  for (int i = 1; i < n_; i++) {
    noFill();
    pushMatrix();
    translate(x_, y_);
    ellipse(0, 0, r*i, r*i);
    popMatrix();
  }
}