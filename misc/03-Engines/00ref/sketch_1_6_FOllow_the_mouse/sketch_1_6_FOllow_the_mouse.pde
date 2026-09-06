Mover m;
void setup() {
  size(640, 360);
  m = new Mover();
}


void draw(){
  background(250);
  m.update();
 //m.edge();
  m.display();
}