Vehicle v ;

void setup(){
  size(600,600);
  background(0);
  v = new Vehicle(width/2,height,6 );
}

void draw(){
  fill(0,0);
  rect(0,0,width,height);
  noFill();
  
  PVector t = new PVector(mouseX, mouseY);
  v.seek(t);
  v.update();
  v.show();
  
  
  
}