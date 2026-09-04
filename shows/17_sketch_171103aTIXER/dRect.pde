class Recta {
  float w = 50; // width of stroke
  float an = 0 ;
  
  Recta(){
     rectMode(CENTER);
  
  }
  
  void run(){
  translate(width/2,height/2);
  fill(0,25);
  noStroke();
  rect(0,0,width,height);
  noFill();
  
  
  noFill();
  stroke(255,50);
  
  for(int i= 0 ; i < 10 ; i++){
    float q = i*100 ;
  float a  = map (mouseX,0,width,width,q);
  float b  = map (mouseY,0,height,height,q);
   float c = map (mouseX,width,q,0,1);
  float si = map(a,q,width,0,w);
  pushMatrix();
  rotate(an);
  scale(c);
    strokeWeight(si);
  rect(0,0,a,b);
  popMatrix();
  }
  an+= 0.001;
  }
  
}