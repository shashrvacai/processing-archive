import processing.video.*;

Capture v ; 
void setup(){
  size(1280,960);
  surface.setResizable(true);
  v = new Capture(this,640,480,30);
  v.start();
}

void mousePressed(){
  background(0);
}


void captureEvent(Capture v_){ 
  v.read();
}

void draw(){  
     fill(0,10);
  rect(0,0,width,height);
  noFill(); 
  
  
 
  image(v, 0,0,width ,height);
  filter(THRESHOLD);
  if(mousePressed){
  
  }
  tint(255,200);
 
 
}
