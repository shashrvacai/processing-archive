Wave w ;

 float ext =125 ;

void setup() {
  background(0);
  size(1000,1000);
  smooth();
  w = new Wave();
}

void draw() {
  fill(0,5);
  rect(0,0,width,height);
  noFill();
  

 
  for (int i = 0 ; i <= height ; i+= ext){
     w.drawWave(i,i+ext,i/ext);
     
  }
}
