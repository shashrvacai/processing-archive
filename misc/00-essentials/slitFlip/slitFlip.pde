import processing.video.*;

Capture v ;
int x =0 ;
PGraphics2D g ,full ;
void setup(){
  size (800,800,P2D);
  v = new Capture(this,1280,720);
  v.start();
  g = (PGraphics2D)createGraphics(width, height, P2D);
}

void captureEvent(Capture v){
  v.read();
}

void draw(){
  for (int i =0 ;i < v.width ; i+= v.width/5){
  
  }
  
  copy(v,v.width/2,0,3,v.height,width/2,0,60,v.height);
  copy(v,v.width/2+3,0,200,v.height,460,0,200,v.height);
  g.beginDraw();
  copy(v,v.width/2,0,3,v.height,width/2,0,60,v.height);
  copy(v,v.width/2+3,0,200,v.height,460,0,200,v.height);
  g.endDraw();
  
  pushMatrix();
  translate(width,0);
  scale(-1,1);
  image(g,0,0);
  popMatrix();
  //x =x+1 ;
  if(x > width){x = 0;}
  //image(v,60,0,512,480);
  println(mouseX,mouseY);
}
