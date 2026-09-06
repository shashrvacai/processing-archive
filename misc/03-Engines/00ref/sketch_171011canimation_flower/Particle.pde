class Particle {
  PVector pos, vel, acc ;
  float m ;
  
  Particle(){
    pos = new PVector(random(width),random(height));
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    m = 1 ;
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force , m);
    acc.add(f);
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }
  
  void show(){
    noStroke();
    fill(150);
    //ellipse(pos.x,pos.y,50,50);
    imageMode(CENTER);
    image(F,pos.x,pos.y,100,100);
  }
  
  void edges() {
    if(pos.x < 0){
       pos.x = width;
    } else if(pos.x > width){
      pos.x = 0;
    }
    if(pos.y < 0){
       pos.y = height;
    } else if(pos.y > height){
      pos.y = 0;
    }
  
  }
}