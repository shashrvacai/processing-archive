class Mover{
  
  PVector pos, vel , acc ;
  float m = random(5,25); 
  float dam = 0.9998;
  float r = 0 ;
  
  Mover(float x_ ,float y_){
    pos = new PVector(x_,y_);
    vel = new PVector();
    acc = new PVector();  
  }
  
  void update(){
    vel.add(acc);
    vel.mult(dam);
    pos.add(vel);
    acc.mult(0);
  }
  
  void applyForce(PVector force){
    PVector f = force.get();
    f.div(m);
    acc.add(f);
  }
  
  void show(){
    
     r = map(mouseX , 0,width,0,255);
    fill(r,150,200);
    noStroke();
    ellipse(pos.x,pos.y,m*2,m*2);
   
  }
  

}