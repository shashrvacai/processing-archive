class Repeller{
  float G = 100 ;
  PVector Rpos ;
  float r = 10 ;
  
  Repeller (float x_,float y_){
    Rpos = new PVector(x_, y_);
  }
  
  void show(){
    fill(38,27,144);
    noStroke();
    ellipse(Rpos.x, Rpos.y, 200,200);
  }
  
  PVector repel(Particle p){
    PVector dir = PVector.sub(Rpos,p.pos);
    float d = dir.mag();
    dir.normalize();
    d = constrain(d, 5,100);
    float f = -1*G/(d*d);
    dir.mult(f);
    return dir;
  }
}