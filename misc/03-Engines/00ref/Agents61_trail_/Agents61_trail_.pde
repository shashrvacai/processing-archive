Vehicle v;

void setup() {
  size(800, 200);
  v = new Vehicle(width/2, height/2);
}

void draw() {

  background(255);

  PVector mouse = new PVector(mouseX, mouseY);


  // Call the appropriate steering behaviors for our agents
  v.seek(mouse);
  v.update();
  v.display();
}