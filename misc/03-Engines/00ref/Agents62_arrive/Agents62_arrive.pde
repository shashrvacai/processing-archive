Veh v;

void setup() {
  size(800, 200);
  v = new Veh(width/2, height/2);
   background(255);
}

void draw() {
  fill(255,15);
  noStroke();
  rect(0,0,width, height);
 noFill();

  PVector mouse = new PVector(mouseX, mouseY);


  // Call the appropriate steering behaviors for our agents
  v.arrive(mouse);
  v.update();
  v.show();
}

void mousePressed(){
 background(255);
}