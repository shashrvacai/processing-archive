PS ps ;


void setup(){
  size(1000,1000);
  ps = new PS(new PVector(width/2,height/2));
}

void draw(){
  background(255);
  
  
  ps.aP();
  ps.run();
}
void keyPressed(){
  PVector grav = new PVector(0,0.1);
  ps.applyF(grav);
}