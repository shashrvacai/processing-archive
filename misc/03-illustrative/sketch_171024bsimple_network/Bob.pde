class Bob {
  PVector pos, vel,acc ;
  float m , r , ran, ls ,d;
  
  
  float A = 0 ;
  color top = color(100, 304, 200);        // color 1
color bottom =  color(200, 177, 5);      // color 2


  
  Bob(){
    ran = 5 ;
    pos = new PVector(random(width),random(height));
    acc = new PVector(random(-ran,ran),random(-ran,ran));
    vel = new PVector(0,0);
    m = 1;
    r = 12 ;
    ls = 255 ;
    
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,m);
    acc.add(f);
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    ls -- ;
  }
  
  void checkEdges() {

    if (pos.x > width) {
      pos.x = width;
      vel.x *= -1;
    } else if (pos.x < 0) {
      vel.x *= -1;
      pos.x = 0;
    }

    if (pos.y > height) {
      vel.y *= -1;
      pos.y = height;
    }else if (pos.y < 0) {
      vel.y*= -1;
      pos.y = 0;
    }

  }
  
  
  void show(){
   
    float x = pos.x +d*sin(A);
    
    float C = map(pos.y, 0, height, 0, 1);
    color c = lerpColor(top, bottom, C);
    stroke(255-c);
    fill(c,ls);
    ellipse(x,pos.y,r,r);
    A +=0.01 ;
  }
  
  
  boolean isDead() {
    if (ls < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }

}