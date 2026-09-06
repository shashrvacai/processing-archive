import processing.video.*;

Capture v ;
int x =0 ;

void setup(){
  size (800,800);
  v = new Capture(this,1280,720);
  v.start();
}

void captureEvent(Capture v){
  v.read();
}

void draw(){
  copy(v,v.width/2,0,1,v.height/2,x,0,60,v.height/2);
  //x =x+1 ;
  if(x > width){x = 0;}
  //image(v,0,0);
}
