Walker w;


void setup(){
  size(800,600);
  
  w = new Walker();
  background(0);
}

void draw(){
 
  w.step();
  w.render();
}

void mousePressed(){
  background(0);
}