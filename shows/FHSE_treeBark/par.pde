class Particle
{
  PVector position, velocity  ;
  

  Particle()
  {
    position = new PVector(random(width),random(height));
    velocity = new PVector(); 
    
  }
  
  void update()
  {  
    float n1 = map(Px,-r,r,0,5);
    float n2 = map(Py,0,r,0,5);
    float velSpeed = map(aa,0 ,0.5 ,0 ,400);
    velocity.x =velSpeed*(noise(n1+position.y/c)-0.5);
    velocity.y = velSpeed*(noise(n1+position.x/d)-0.5);
    position.add(velocity);
    
   
    
    if(position.x<0)position.x+=width;
    if(position.x>width)position.x-=width;
    if(position.y<0)position.y+=height;
    if(position.y>height)position.y-=height;
  
  }

  void render()
  {
    stroke(255);
    line(position.x,position.y,position.x-velocity.x,position.y-velocity.y);
  }
}