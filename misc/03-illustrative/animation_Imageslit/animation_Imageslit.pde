PImage img;


int w= 2 ; 
float a = 0.0 ;
void setup() {
  size(1000, 1000);
  img = loadImage("03.png");
}

void draw() {

  background(255);
  image(img, 3, 0,width,height);
  float x = sin(a) * width/8-8 ;

  noStroke();
  fill(0);

  pushMatrix();
  //translate(mouseX, 0);
  translate(x+width/4, 0);
  drawSlit();
  popMatrix();
  a+=0.005 ;
  if (mousePressed) {
    save("grid.png");
  }
}

void drawSlit() {
  for (int i =-width/2; i < width; i+= 5*w) {
    rect(i, 0, w*4, height);
  }
}
