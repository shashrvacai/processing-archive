vehicle v ;

void setup(){
  size(600, 600);
  v = new vehicle(width/2,height/2);
  
}

void draw(){
  background(150);
    
  PVector mouse = new PVector(mouseX,mouseY);
  v.arrive(mouse);
  v.go();
}