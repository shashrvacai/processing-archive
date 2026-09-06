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
  fill(255);
  rect(100,100,300,300);
  
  
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
    
    if (m.pos.x > 100 && m.pos.x < 400 
      && m.pos.y > 100 && m.pos.y < 400  ){
      
       PVector fric = m.vel.get();
       fric.normalize();
       float c = -10;
       fric.mult(c);
       m.applyForce(fric);
      }
    
    
    m.show();
    m.update();
    m.edges();
  
  }
}