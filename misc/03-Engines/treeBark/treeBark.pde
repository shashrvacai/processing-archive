import processing.sound.*;

Amplitude amp ;
AudioIn in;

int NUM_PARTICLES = 2000;
ParticleSystem p;
void setup(){
  smooth();
  size(500,500);
  surface.setResizable(true);
  background(0);
  p = new ParticleSystem();
  
  amp = new Amplitude(this);
  in  = new AudioIn(this,0);
  in.start();
  amp.input(in); 
}

void draw(){
  float a = amp.analyze()*100;
  //println(frameRate,mouseX/10);
  noStroke();
  fill(0,5);
  rect(0,0,width,height);
  p.update(a);
  p.render();
}
