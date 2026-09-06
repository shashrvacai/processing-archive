class confetti  extends particle{
  
  confetti(PVector l_){
    super(l_);
  }
  
  void show(){
    rectMode(CENTER);
    fill(127,ls);
    stroke(0,ls);
    strokeWeight(2);
    pushMatrix();
    translate(pos.x,pos.y);
    float theta = map(pos.x,0,width,0,TWO_PI*2);
    rotate(theta);
    rect(0,0,12,12);
    popMatrix();
  }
}