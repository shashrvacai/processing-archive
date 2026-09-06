ParticleSystem ps ;

void setup(){
  size(600,600);
  background(0);
  ps = new ParticleSystem(new PVector(random(width),random(height)));
}

void draw(){
  fill(0,50);
  rect(0,0,width,height);
  
  ps.addParticle();
ps.run();

  

}