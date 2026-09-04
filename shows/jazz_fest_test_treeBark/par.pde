class Particle
{
  PVector position, velocity  ;
  float p = width/4, q = height/4, ww = 500, hh = 500 ;     // p,q origin of bounding box , ww/hh - width/height of bounding box 

  Particle()
  {
    position = new PVector(random(width), random(height));
    velocity = new PVector();
  }

  void update()
  {  
    float n1 = map(Px, -r, r, 0, 5);
    float n2 = map(Py, 0, r, 0, 5);
    float velSpeed = map(aa, 0, 0.5, 0, 400);
    velocity.x =velSpeed*(noise(n1+position.y/c)-0.5);
    velocity.y = velSpeed*(noise(n1+position.x/d)-0.5);
    position.add(velocity);

    p  = map(noise(nOff.x), 0, 1, 0, width/4);
    q  = map(noise(nOff.y), 0, 1, 0, height/4);
    ww = map(noise(nOff.x), 0, 1, width-width/4, width);
    hh = map(noise(nOff.y), 0, 1, height-height/4, height);

    if (position.x<0)position.x=width;
    if (position.x>width)position.x=0;
    if (position.y<0)position.y =height;
    if (position.y>height)position.y=0;
  
  
     /// ------ moving bounding box
     
    //if (position.x<p)position.x=p+ww;
    //if (position.x>p+ww)position.x=p;
    //if (position.y<q)position.y =q+hh;
    //if (position.y>q+hh)position.y=q;
  }

  void render()
  {
    stroke(255);
    strokeWeight(5);
    noFill();
    line(position.x, position.y, position.x-(1*velocity.x), position.y-(1*velocity.y));
    
  }
}
