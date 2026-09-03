Spring spring ;
Mover[] bob = new Mover[20] ;

void setup() {
  background(0);
  size(600, 600);

  spring = new Spring(width/2, height/2, 100);
  for (int i =0; i < bob.length; i++) {
    bob[i] = new Mover(width/2, i*10);
  }
}

void draw() {
  fill(0, 15);
  rect(0, 0, width, height);
  noFill();

  PVector w = new PVector(1, 0);
  PVector g = new PVector(0, 0.2);
  
  for (int i =0; i < bob.length; i++) {
 
    if (mousePressed) {
      bob[i].applyForce(w);
    }
    
    bob[i].applyForce(g);
    spring.connect(bob[i]);
    //bob.applyForce();
    bob[i].update();
    bob[i].show();
  }
}