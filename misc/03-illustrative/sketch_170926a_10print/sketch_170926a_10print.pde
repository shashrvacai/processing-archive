float x = 0 ;
float y = 0 ;
float s = 50;                      // size of lines

void setup(){
  size(1000,1000);
  background(0);
}

void draw(){
  strokeWeight(s/3);
  stroke(255);
  float  m = map(mouseY , 0,height, 0,1);
  if(random(1)>m) {
  line(x,y,x+s,y+s);
  }else{
    line(x,y+s,x+s,y);
  }
  
  y+= s ;
  if(y > width){
    y =0 ;
    x+= s ;
  }
  
}