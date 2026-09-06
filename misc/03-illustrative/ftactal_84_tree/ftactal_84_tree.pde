float t = 45 ;

void setup(){
  size(600,600);
  
}

void draw(){
  background(255);
  translate(width/2,0);
  stroke(0);
  branch(200);
  
  t = radians(map(mouseX, 0,width,0,180));
}

void branch(float l_){
  
  
  line(0,0,0,l_);
  translate(0,l_);
  l_ *= 0.6 ;
  
  if (l_> 2){
  pushMatrix();
    rotate(t);
    branch(l_);
  popMatrix();
  pushMatrix();
    rotate(-t);
    branch(l_);
  popMatrix();
  }
}