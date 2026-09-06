Mover[] movers;

void setup() {
  size(600,600);
  movers = new Mover[5];
  for (int i = 0 ; i < movers.length ; i++){
    movers[i] = new Mover();
  }
}

void draw() {
  background(0);
  
  for (Mover m : movers){
    
    PVector g = new PVector(0,1);
    g.mult(m.mass);
    m.applyForce(g);
    
    if(mousePressed){
      PVector mouse = new PVector(mouseX,mouseY);
      mouse.sub(m.pos);
      mouse.setMag(5);
      m.applyForce(mouse);
    }
    
    
    m.show();
    m.update();
    m.edges();
  
  }
}