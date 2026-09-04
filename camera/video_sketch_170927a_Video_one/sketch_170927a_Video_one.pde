import processing.video.*;

PImage frog;
Capture V ,J;
//Movie M;

void setup() {
  size(1000, 1000);
  background(0);
  frog =  loadImage("frog.png");
  V = new Capture(this, 640,480,30);
  V.start();
  //image(frog,0, 0,width, height);
  frog =  loadImage("frog.png");
  V = new Capture(this, 640,480,30);
  V.start();
}
void mousePressed(){
  V.read();
}


void capturedEvent(Capture video){
  
}


void draw() {
  if(V.available()){
  V.read();
  }
  //background(0);
  float x =random(width);
  float y = random(height);
  color c = V.get(int(x),int(y));
  fill(c);
  //image(V,0, 0,width, height);
  noStroke();
  
  ellipse(x,y,20,20);
}