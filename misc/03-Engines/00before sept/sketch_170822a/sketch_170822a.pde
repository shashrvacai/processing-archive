Mover m;

void setup() {
  size(600, 600);
  background(0);
  
  m = new Mover();
}

void draw() {
  
  background(0);
  
  PVector  f = new PVector(0.1, 1); 
  m.applyForce(f);
  
   if (mousePressed){
     PVector  g = new PVector(-0.2, -2); 
    m.applyForce(g);
   }
  
  m.update();
  m.edges();
  m.display();
}