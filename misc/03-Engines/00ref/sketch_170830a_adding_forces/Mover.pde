class Mover {
  PVector pos ;
  PVector vel ;
  PVector acc ;
  float mass ;
  float R, G,B ;
  
  Mover(){
    pos = new PVector(random(width),height/2);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    mass = random(1,5); 
    R = random(255); G = random(255);B = random(255);
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force,mass);    
    acc.add(f);
  }
  
  
  void update(){
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }
  
  
  
  void edges() {
    if(pos.x > width){
      pos.x = width;
      vel.x *= -1;
    }else if (pos.x < 0){
      pos.x = 0 ;
      vel.x *= -1 ;
    }if(pos.y > height){
      pos.y = height;
      vel.y *= -1;
    }else if (pos.y < 0){
      pos.y = 0 ;
      vel.y *= -1 ;
    }
  }
  
  void show(){
    fill(R,G,B);
    ellipse(pos.x,pos.y, mass*10,mass*10);
  }
}