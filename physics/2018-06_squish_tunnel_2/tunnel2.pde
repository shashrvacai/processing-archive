float distance = 0.0;
float speed = 5;
float objStep = 40;

color c1, c2;
boolean useRect;

void setup(){
  //fullScreen(P3D);
  size(640, 640, P3D);
  rectMode(CENTER);
  mousePressed();
}

void mousePressed(){
  c1 = color(random(255), random(255), random(255));
  c2 = color(random(255), random(255), random(255));
  useRect = random(1) < 0.5 ? true: false;
}

void draw(){
  background(c1);
  translate(width / 2, height / 2);
  float camX = map(mouseX, 0, width, -100, 100);
  float camY = map(mouseY, 0, height, -100, 100);
  camera(camX, camY, 0, 0, 0, 200, 0, 1, 0);
  stroke(c2);
  strokeWeight(2);
  noFill();
  for(float depth = 0; depth < 1500; depth += objStep){
    pushMatrix();
    translate(0, 0, depth - distance % objStep);
    float objSize = map(noise((distance + depth - distance % objStep) * 0.004), 0, 1, 50, 200);
    if(useRect){
      rect(0, 0, objSize, objSize);
    } else {
      ellipse(0, 0, objSize, objSize);
    }
    popMatrix();
  }
  distance += speed;
}
