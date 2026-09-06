
float t = 0;
float A=0;


void setup(){
  size(600,400);
  background(255);
}


void draw(){
  
  fill(255);
  
  float x = noise(t);
  
  x = map(x , 0,1,0, height);
  
  pushMatrix();
  //translate(10,0);
  ellipse(A, x , 40,40);
  
  popMatrix();
 t = t + 0.01;
 A = A + 1;
}