class Par{
  PVector pos, vel, acc ;
  float ls ;
  PImage  img ;
  
  Par(PVector l_ , PImage img_){
    acc = new PVector(0,0);
    float vx = randomGaussian()*0.3;
    float vy = randomGaussian()*0.3-1.0;
    vel = new PVector(vx , vy);
    pos = l_.get();
    ls = 100 ;
    img = img_;
  }
  
  void run(){
    update();
    show();
  }
  
  void af(PVector f_){
    acc.add(f_);
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    ls -= 2 ;
  }
  
  void show(){
    imageMode(CENTER);
    tint(15,255,140,ls);
    image(img , pos.x,pos.y);
  }
  
  boolean isDead(){
    if(ls <= 0){
      return true;
    }else {
      return false ;
    }
    
  }
}