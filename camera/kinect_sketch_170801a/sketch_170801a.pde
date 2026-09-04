import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

Kinect2 kinect2;

void setup() {
  size(1280, 1144, P3D);

  kinect2 = new Kinect2(this);

  kinect2.initDepth();
  //kinect2.initVideo();
  
  kinect2.initDevice();
}

void draw() {
scale(2);
  background(0,10);

  PImage img = kinect2.getDepthImage();



  int s = 1; // skip
  for (int x = 0; x < img.width; x += s) {
    for (int y = 0; y < img.height; y+=s) {
      int index = x + y * img.width;
      float b  = brightness(img.pixels[index]);
      float z = map(b, 0, 255, 150, -150) ;
      float m = map(b, 0, 255, 5, 0.5) ;
      fill(255-b, 0, 255-b);
      noStroke(); 
        pushMatrix();
          translate(x, y, z);
          rotate(PI/4);
          rect(0, 0, s, s);
        popMatrix();
    }
  }
}