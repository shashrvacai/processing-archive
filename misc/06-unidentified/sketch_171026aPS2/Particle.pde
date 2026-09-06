class Particle{
  PVector pos, vel, acc ;
  float m , ls ,r,a ;
  
  Particle(PVector o_){
    pos = o_.get();
    acc = new PVector(random(-0.04,0.04),random(-0.04,0.04));
    vel = new PVector(random(1,-1),random(-2,2));
    m = 1 ;
    r = 10 ;
    ls = 255 ;
    a =0 ;
  }
  
  void run(){
    update();
    show();
    checkEdges();
  }
  
  
  void applyForce(PVector force){
    //float f = PVector.div(force,m);      
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
    ls -= 1 ;
    a+= 0.2 ;
  }
  
  void show(){
    noStroke();
    fill(255,ls/2  );
    //ellipse(pos.x, pos.y , r,r );
    float x = sin(a)*random(r*2);
    float y = cos(-a)*random(r*2);
    fill(ls,250,150,255-ls  );
    ellipse(pos.x+ r/4 + x, pos.y+ r/4 +y, r/2,r/2 );
    ellipse(pos.x+ r/4 - x, pos.y+ r/4 -y, r/2,r/2 );
  }
  
  boolean isDead(){
    if (ls<0){
      return true;
    }else{
      return false;
    }
  
  }
  void checkEdges(){
      if (pos.x > width){
        pos.x = width;
        vel.x *= -1 ;  
      } else if(pos.x < 0){
        pos.x = 0;
        vel.x *= -1 ; 
      }
      
      if (pos.y > height){
        pos.y = height;
        vel.y *= -1 ;  
      } else if(pos.y < 0){
        pos.y = 0;
        vel.y *= -1 ; 
      }
  }
  
}