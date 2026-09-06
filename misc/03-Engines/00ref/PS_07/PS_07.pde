PS ps ;
Repeller rep ;

void setup(){
  size(1000,1000);
  ps = new PS(new PVector(width/2,50));
  rep = new Repeller(width/2 , height/2);
  
}

void draw(){
  background(255);
  ps.aP();
  
  PVector grav = new PVector(0,0.1);
  ps.applyF(grav);
  
  ps.aR(rep);
  
  rep.show();
  ps.run();
}