class Leaf {
  PVector pos;
  
  Leaf(PVector l_){
    pos = l_.get();
    
  }
  
  void show(){
    noStroke();
    fill(50,100);
    ellipse(pos.x, pos.y,4,4);
  }
}