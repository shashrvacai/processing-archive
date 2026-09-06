Mover m;
Attractor a;

void setup() {
  size(640,360);
  m = new Mover(); 
  a = new Attractor();
  background(255);
}
void draw() {
  

  PVector force = a.attract(m);    
  m.applyForce(force);
  m.update();
  
  a.drag();
  //a.hover(mouseX,mouseY);
 
  a.display();
  m.display();
}

void mousePressed() {
  a.clicked(mouseX,mouseY); 
}

void mouseReleased() {
  a.stopDragging(); 
}