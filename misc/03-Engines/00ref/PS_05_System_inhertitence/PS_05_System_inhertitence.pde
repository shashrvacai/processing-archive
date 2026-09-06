ArrayList<PS> systems ;

void setup(){
  size(650,400);
  systems = new ArrayList<PS>();
}

void draw(){
  background(255);
  for(PS ps: systems){
  ps.addParticle();
  ps.run();
  }
  
}

void mousePressed(){
  systems.add(new PS( new PVector(mouseX, mouseY)));
}