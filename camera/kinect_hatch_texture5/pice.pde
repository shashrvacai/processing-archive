class Pice {
  
  PVector loc ;
  PVector vel ;
  PVector acc ;

  Pice() {
    loc =  new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0.00, 0.00);
    
  }
  void update() {
   
    vel.add(acc);
    loc.add(vel);
    vel.limit(5);
    
  }

  void edge() {
    if (loc.x > width) loc.x = 0 ;
    if (loc.x < 0) loc.x = width ;
    if (loc.y > height) loc.y = 0 ;
    if (loc.y < 0) loc.y = height ;
  }
  void display() {
    noStroke();
    fill(0, 10);
    ellipse(loc.x, loc.y, 75, 75);
  }
}