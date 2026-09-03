Vehicle v ;

void setup(){
  size(600,600);
  v = new Vehicle(320,180);

}

void draw(){
  background(51);
  
  PVector T = new PVector(mouseX , mouseY);
  
  v.seek(T);
  
 // v.checkEdges();
  v.update();
  v.show();
}