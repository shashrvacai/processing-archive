import org.openkinect.processing.*;

Kinect2 K ;

void setup(){
  size(1024,848,P3D);
  K = new Kinect2(this);
  
  K.initDepth();
  K.initDevice();
}

void draw(){
  scale(2);
  background(0,10);
  
  PImage dep =  K.getDepthImage();
  
  int s =5;
  for(int x = 0 ; x < dep.width ; x+=s){
      for(int y = 0 ; y < dep.height ; y+=s){
        int  i = x + y* dep.width;
        float b = brightness(dep.pixels[i]);
        float z = map(b , 0,255,0,-250);
        float m = map(b , 0,255,0.1,5);
        fill(b,255-b, 255-b,b);
        noStroke(); 
        pushMatrix();
          translate(x, y, z);
          //rotate(PI/4);
          ellipse(0, 0, s*m, s*m);
        popMatrix();
      }
  }
}