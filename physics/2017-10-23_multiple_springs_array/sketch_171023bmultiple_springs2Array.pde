Spring[] spring= new Spring[20] ;
Mover[] bob = new Mover[20] ;

void setup() {
  background(0);
  size(600, 600);
  

  ;
  for (int j =0; j < 5; j++) {
    for (int i =0; i < bob.length; i++) {
      bob[i] = new Mover(j*10, i*50);
      spring[i] = new Spring(bob[i].pos.x,bob[i].pos.y, 100);
    }
  }
}

void draw() {
  
  fill(0, 15);
  rect(0, 0, width, height);
  noFill();
  
  translate(width,height/2);
  rotate(PI/2);
  
  PVector w = new PVector(1, 0);
  PVector g = new PVector(0, 0.2);
  
  for (int i =0; i < bob.length; i++) {
 
    if (mousePressed) {
      bob[i].applyForce(w);
    }
    
    bob[i].applyForce(g);
    spring[i].connect(bob[i]);
    //bob.applyForce();
    bob[i].update();
    bob[i].show();
  }
}