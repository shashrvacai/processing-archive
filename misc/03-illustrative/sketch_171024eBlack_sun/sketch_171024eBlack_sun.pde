float r = 250 ;
float a = 0 ;
float red = 0.022;
void setup(){
  size(1000,1000);
  background(0);
}

void draw(){
  translate(width/2, width/3+50);
  scale(1.5);
  //rotate(a);
  fill(255);
  noStroke();
  
  pushMatrix();
  rotate(-a);
  float x = r *sin(a);
  float y =( r/red)  *cos(a);
  
  ellipse(x,y,2,2);
  red +=0.001;
  popMatrix();
  
  a+= 0.1;
  
}