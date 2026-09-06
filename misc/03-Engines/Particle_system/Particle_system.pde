int NUM_PARTICLES = 1000;
ParticleSystem p;
void setup()
{
  smooth();
  size(500,500);
  background(0);
  p = new ParticleSystem();
}

void draw()
{
  println(frameCount);
  noStroke();
  fill(0,5);
  rect(0,0,width,height);
  p.update();
  p.render();
}