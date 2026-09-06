void setup(){
  size(600,600);
   
}

void draw() {
  background(0);
  noFill();
  stroke(255);
  translate(width/2 ,0);
  float d = width/2 ;
    for ( int i = 0 ; d > 2 ; i++ ){
      float  x =d ;
      for (int j = 0 ; j < pow(2 ,i); j++){
        ellipse(x ,height/2,d,d);
        x += d*2;
      }
      d /= 2 ;
    }
}