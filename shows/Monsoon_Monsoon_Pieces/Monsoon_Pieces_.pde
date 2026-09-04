 //<>//
import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
int dMax=  2750, dMin = 1550 , rX3, rW3, rW2, rX2, rX1, rW1,rX4,rW4,rX5,rW5;
int bX3, bW3, bW2, bX2, bX1, bW1, bW4 ,bX4 , bW5, bX5 ;
Kinect2 kinect2;
PImage g ,v  ;
PGraphics2D  K;

void setup() {
  size(1368, 788, P2D);
  
  kinect2 = new Kinect2(this);
  kinect2.initVideo();
  kinect2.initDepth();
  kinect2.initRegistered();
  // Start all data
  kinect2.initDevice();

  K = (PGraphics2D)createGraphics(width, height, P2D);
  
    rX1 = 300;     rW1=200;
    rX2 = rX1+rW1; rW2 =200;
    rX3 = rX2+rW2; rW3=200 ;
    rX4 = rX3+rW3; rW4 =200;
    rX5 = rX4+rW4; rW5 = 200 ; 
      
    bX1 = 0 ;     bW1 = 300 ;
    bX2 = bX1+bW1 ; bW2 =200 ;
    bX3 = bX2+bW2 ; bW3 = 300 ;
    bX4 = bX3+bW3 ; bW4 = 300 ;
    bX5 = bX4+bW4 ; bW5 = 285; 
}

void draw() {
  background(0);
  //println(K.width,K.height);
  pushMatrix();
  K.beginDraw();
   fill(0,50);
  rect(0,0,width,height);
  translate(0,-100);
  scale(2.7);
  Dkinect();
  K.endDraw();
  popMatrix();

  imageMode(CENTER);
  
  //image(K, width/2, height/2,500, 400);
  
  copy(K,  rX1, K.height/2-200, rW1, 3,   bX1, 0, 300, 50);
  copy(K,  rX1, K.height/2-200, rW1, 100, bX1, 50, 300, 50);
  copy(K,  rX1, K.height/2-100, rW1, 3,   bX1, 100, 300, 100);
  copy(K,  rX1, K.height/2-100, rW1, 100, bX1, 200, 300, 100);
  copy(K,  rX1, K.height/2,     rW1, 3,   bX1, 300, 300, 200);
  copy(K,  rX1, K.height/2,     rW1, 300, bX1, 500, 300, 100);
  copy(K,  rX1, K.height/2+300, rW1, 300, bX1, 600, 300, 200);
  
  copy(K,  rX2, K.height/2-200, rW2, 3,   bX2,0, 300, 50);
  copy(K,  rX2, K.height/2-200, rW2, 100, bX2, 50, 300, 50);
  copy(K,  rX2, K.height/2-100, rW2, 3,   bX2, 100, 300, 100);
  copy(K,  rX2, K.height/2-100, rW2, 100, bX2, 200, 300, 100);
  copy(K,  rX2, K.height/2,     rW2, 3,   bX2, 300, 300, 200);
  copy(K,  rX2, K.height/2,     rW2, 300, bX2, 500, 300, 100);
  copy(K,  rX2, K.height/2+300, rW2, 300, bX2, 600, 300, 200);
  
  copy(K,  rX3, K.height/2-200, rW3, 3,   bX3,0, 300, 50);
  copy(K,  rX3, K.height/2-200, rW3, 100, bX3, 50, 300, 50);
  copy(K,  rX3, K.height/2-100, rW3, 3,   bX3, 100, 300, 100);
  copy(K,  rX3, K.height/2-100, rW3, 100, bX3, 200, 300, 100);
  copy(K,  rX3, K.height/2,     rW3, 3,   bX3, 300, 300, 200);
  copy(K,  rX3, K.height/2,     rW3, 300, bX3, 500, 300, 100);
  copy(K,  rX3, K.height/2+300, rW3, 300, bX3, 600, 300, 200);
  
  copy(K,  rX4, K.height/2-200, rW4, 3,   bX4,0, 300, 50);
  copy(K,  rX4, K.height/2-200, rW2, 100, bX4, 50, 300, 50);
  copy(K,  rX4, K.height/2-100, rW4, 3,   bX4, 100, 300, 100);
  copy(K,  rX4, K.height/2-100, rW4, 100, bX4, 200, 300, 100);
  copy(K,  rX4, K.height/2,     rW4, 3,   bX4, 300, 300, 200);
  copy(K,  rX4, K.height/2,     rW4, 300, bX4, 500, 300, 100);
  copy(K,  rX4, K.height/2+300, rW4, 300, bX4, 600, 300, 200);
  
  copy(K,  rX5, K.height/2-200, rW5, 3,   bX5,0, 300, 50);
  copy(K,  rX5, K.height/2-200, rW5, 100, bX5, 50, 300, 50);
  copy(K,  rX5, K.height/2-100, rW5, 3,   bX5, 100, 300, 100);
  copy(K,  rX5, K.height/2-100, rW5, 100, bX5, 200, 300, 100);
  copy(K,  rX5, K.height/2,     rW5, 3,   bX5, 300, 300, 200);
  copy(K,  rX5, K.height/2,     rW5, 300, bX5, 500, 300, 100);
  copy(K,  rX5, K.height/2+300, rW5, 300, bX5, 600, 300, 200);
}
