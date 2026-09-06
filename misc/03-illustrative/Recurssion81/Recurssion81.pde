
float a =0 ;
void setup(){
  size(600,600);
  background(255);
}
void draw(){
  fill(255,5);
  rect(0,0,width,height);
  //noFill();
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(a);
  dC(0, 0,width,a);
  popMatrix();
  a+=0.01;
}

void dC(float x_,float y_, float r_, float a_){
  stroke(0);
 // fill(255);
  strokeWeight(r_/60);
  ellipse(x_,y_,r_,r_);
  if(r_>2){
    pushMatrix();
    translate(x_, y_+r_/4);
    rotate(a);
    dC(0,0,r_/2,a_);
    dC(0,0,r_/2,a_);
    popMatrix();
    
    
    
  }
}