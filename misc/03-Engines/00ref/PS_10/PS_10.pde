PS ps ;

void setup(){
  size(640,360);
  ps = new PS(new PVector(width/2,50));
}

void draw(){
  background(255);
  PVector mouse = new PVector(mouseX, mouseY);
  
  ps.aP(mouse);
  ps.run();
  ps.intersection();

}