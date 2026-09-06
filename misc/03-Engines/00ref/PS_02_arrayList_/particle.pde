class Particle{
  PVector pos, vel, acc ;
  float ls ;
  
  Particle(PVector l_){
    pos = l_.get();
    acc = new PVector(0,0.05);
    vel= new PVector(random(-1,1),random(-1,1));
    ls = 255 ;
  }
  
  void run(){
    update();
    show();
  }
  
  void update(){
  vel.add(acc);
  pos.add(vel);
  ls -= 2 ;
  }
  
  void show(){
    fill(127);
    ellipse(pos.x,pos.y, 25,25);
  }
  
  boolean isDead(){
    if(ls < 0){
      return true ;
    } else {
      return false ; 
    }    
  }
}