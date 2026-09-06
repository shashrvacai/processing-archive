import java.util.Random;

Random gen ;
int s = 60 ; 

void setup() {
  size(400, 600);
  background(255);
  gen = new Random();
}

void draw() {
  
  float h = (float) gen.nextGaussian();
  
  h = (h *10)+width/2;   // standard deviation
 //h = h + 200;  // mean 
  
  
  fill(0,2);
  ellipse(h,height/2,h,h);
  
}