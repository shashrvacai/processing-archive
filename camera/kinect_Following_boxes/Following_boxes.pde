// ----  'u'  start-stop particles.


import processing.video.*;
import org.openkinect.processing.*;

ArrayList<veh> vs ;
Kinect2 K ;   // k in the kinect object

Capture grab;

boolean R = false ;
float dMin = 512 ;
float dMax = 1000 ;
boolean ON = true ;

void setup() {
  size(1280, 720);
  surface.setResizable(true);
  K = new Kinect2(this);
  background(255);

  K.initDepth();  // int depth ; 
  K.initDevice();
  
  grab = new Capture(this, 640, 360);
  grab.start();
  
  vs = new ArrayList<veh>();
  for(int i = 0 ; i < 1 ; i++){
    vs.add(new veh(random(width),random(height)));
  }
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  scale(2);
  fill(255,10);
  rect(0,0,width, height);
  noFill();

  PImage dep =  K.getDepthImage();  // depth img
  //image(dep,0,0);   // test depth image
  int[]  Rdep = K.getRawDepth();

  float sX = 0 ;   /// sum of X 
  float sY = 0 ;   /// sum of Y
  float tP = 0 ;   /// total number of pixels 

  float s = 2;    // skip
  float r = 2;    // range
  for (int x = 0; x < dep.width; x+=s) {
    for (int y = 0; y < dep.height; y+=s) {
      int  i = x + y* dep.width;    // index 
      float b = brightness(dep.pixels[i]);  
      int d = Rdep[i];   // depth index
      float n = map(d, dMin, dMax, 10, 255);
      float si = map(n, 0, 255, s*r, s/r);
      //float si = map(n, 0, 255, s*r, s/r);   ///reverse

      float m = map(b, 0, 255, 8, 50); // mapping brightness values 

      if (d >dMin && d <dMax) {

        fill(255, 255-n, n, 255);   // pink to orange
        noStroke();
        ellipse(x, y, si, si);
        sX += x ;
        sY += y ;
        tP ++ ;
      } else {
      }
    }
  }

  float aX = sX /tP ;
  float aY = sY /tP ;
  if(tP > 0){
     aX = sX /tP ;
     aY = sY /tP ;
  } else {
    aX = 0 ;
    aY = 0 ;
  }
  
  fill(125);
 // ellipse(aX, aY, 20, 20);
  
  for(veh v :vs){
    v.aB(vs, aX,aY);
    v.update();
    v.show();
  }
  
  if( ON == true){
    fill(195,100,20);
    ellipse(width-10,10,5,5);
   vs.add(new veh(aX, aY));
  } else{
  }
  
  
  if(mousePressed){
     //vs.add(new veh(aX, aY));
  }
  
}

void keyPressed(){
  if(key == 'u'){
    ON = !ON ;
  } 
}
