Mover[] movers;

void setup() {
  size(600, 600);
  background(0);
  
  movers = new Mover[5];
  for (int i = 0 ; i < movers.length ; i ++){
    movers[i] = new Mover();
  }
}

void draw() {
  
 //background(0);
  
  for (Mover m : movers){
  
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
}