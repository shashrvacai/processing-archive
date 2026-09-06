class Mover{
  PVector loc;
  PVector vel ;
  PVector acc ;
  
  Mover() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  
  void applyForce(PVector force){
    acc.add(force) ;
  }
  
  void update(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
     //vel.limit(5);
  }
  
  void display(){
    fill(255);
    ellipse(loc.x, loc.y, 50,50);
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