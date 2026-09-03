Vehicle v ;

void setup(){
  size(1000,1000);
  background(0);
  v = new Vehicle(width/2,height/2,6 );
}

void draw(){
  fill(0,0);
  rect(0,0,width,height);
  noFill();
  
  PVector t = new PVector(mouseX, mouseY);
  v.arrive(t);
  v.update();
  v.show();
  
  if (keyPressed ){
    if(key == 'r'){
    background(0);
    }
  }
  
  
}