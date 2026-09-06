class Particle
{
  PVector position, velocity;

  Particle()
  {
    position = new PVector(random(width),random(height));
    velocity = new PVector(); 
  }
  
  void update(float p_)
  {  
    float n1 = map(mouseX,0,0.5,0,1);
    velocity.x = p_*10*(noise(n1+position.y/500)-0.5);
    velocity.y = p_*-10*(noise(position.x/100)-0.5);
    position.add(velocity);
    
    if(position.x<0)position.x+=width;
    if(position.x>width)position.x-=width;
    if(position.y<0)position.y+=height;
    if(position.y>height)position.y-=height;
  }

  void render()
  {
    stroke(255,0,0);
    line(position.x,position.y,position.x-velocity.x,position.y-velocity.y);
  }
}
