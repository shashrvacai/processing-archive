
import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

Kinect2 kinect2;

PImage  img;

float a = 0;

void setup(){
  size(1024,848);
  kinect2 = new Kinect2(this);
  kinect2.initDepth();
  kinect2.initDevice();
  img = createImage(kinect2.depthWidth,kinect2.depthHeight, RGB);
}

void draw(){
  scale(2);
  background(255);
   
  img.loadPixels();
  
  int[] depth = kinect2.getRawDepth();
 
  //beginShape(POINTS);
  for(int x = 0 ; x < kinect2.depthWidth; x++){
    for(int y = 0; y < kinect2.depthHeight ; y++){
      int offset = x + y * kinect2.depthWidth;  // index of the pixel
      int d = depth[offset];
      float  m = map(d , 300,850,0,255);
      
      if(d >300 && d < 850){
        fill(255-m,255-m,0);       
      img.pixels[offset] = color(m,120,255-m);
      }else{
        img.pixels[offset] = color(0);
        
      }
    }
  }
  
  img.updatePixels();
  image(img,0,0);  
  
}