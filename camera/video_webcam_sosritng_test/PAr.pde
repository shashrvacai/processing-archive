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
  ls -= 1 ;
  }
  
  void show(){
    noStroke();
    color c = Buffer.get(int(pos.x), int(pos.y));
    //println(c);
    fill(c,ls);
    ellipse(pos.x,pos.y, 5,5);
  }
  
  boolean isDead(){
    if(ls < 0){
      return true ;
    } else {
      return false ; 
    }    
  }
}
