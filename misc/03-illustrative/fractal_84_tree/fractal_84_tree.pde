void setup(){
  size(600,600);
  nT();
}

void draw(){
  noLoop();
}

void mousePressed(){
  pushMatrix();
  nT();
  popMatrix();
  redraw();
}

void nT(){
  background(255);
  fill(0);
  stroke(0);
  translate(width/2, height);
  b(width/4);
}

void b(float h_){
  float sw = map(h_,2,120,1,5);
  strokeWeight(sw);
  float t = random(0 , PI/3);
  
  line(0,0,0,-h_);
  translate(0,-h_);
  h_ *= 0.66 ;
  if(h_ > 2){
        pushMatrix();
        rotate(t);
        b(h_);
        popMatrix();
        pushMatrix();
        rotate(-t);
        b(h_);
        popMatrix();
  }
}