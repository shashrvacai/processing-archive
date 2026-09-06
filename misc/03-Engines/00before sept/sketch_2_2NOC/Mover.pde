class Mover{
  PVector loc;
  PVector vel ;
  PVector acc ;
  float m;
  
  Mover() {
    loc = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    m = random(1,5);
  }
  
  void applyForce(PVector force){
    acc.add(force) ;
    PVector f = PVector.div(force,m);
  }
  
  void update(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
     //vel.limit(5);
  }
  
  void display(){
    fill(255);
    ellipse(loc.x, loc.y, m*5,m*5);
  }
  
  void edges(){
    if (loc.x > width ){
       loc.x = width ;
       vel.x *= -1;
    } else  if(loc.x < 0){
      loc.x = 0 ;
       vel.x *= -1;
    }else if (loc.y > height ){
       loc.y = height ;
       vel.y *= -1;
    } else if (loc.y < 0){
      loc.y = 0 ;
       vel.y *= -1;
    }
  }
  

}