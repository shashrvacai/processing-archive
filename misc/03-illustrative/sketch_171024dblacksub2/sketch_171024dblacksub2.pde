float r = 250 ;
float a = 0 ;
float red = 0.022;
void setup(){
  size(600,600);
  background(0);
}

void draw(){
  translate(width/2, height/2);
  //rotate(a);
  fill(255);
  noStroke();
  
  float x = r *sin(a);
  float y =( r/red)  *cos(a);
  
  ellipse(x,y,2,2);
  red +=0.001;
  a+= 0.05;
}