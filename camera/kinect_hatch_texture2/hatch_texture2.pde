import org.openkinect.processing.*;

Kinect2 K ;   // k in the kinect object

void setup(){
  size(1024,848);
  K = new Kinect2(this);
  
  K.initDepth();  // int depth ; 
  K.initDevice();
}

void draw(){
  scale(2);
  background(0);
  
  PImage dep =  K.getDepthImage();  // depth img
  //image(dep,0,0);   // test depth image
  
  
  int s = 2;    // skip
  for(int x = 0 ; x < dep.width ; x+=s){
      for(int y = 0 ; y < dep.height ; y+=s){
        int  i = x + y* dep.width;    // index 
        float b = brightness(dep.pixels[i]);  
        float z = map(b , 0,255,0,100);
        float m = map(b , 0,255,7,1);
        fill(b,255-b, 0,b);
        noStroke(); 
        pushMatrix();
          translate(x, y);
          rotate(PI/4);
          ellipse(0, 0, s*m+2, s);
        popMatrix();
      }
  }
}