import org.openkinect.processing.*;

float A =0;
Kinect2 a;

void setup(){
  size(1920,1080);
  a = new Kinect2(this);
  
  a.initVideo();
  a.initDevice();
}

void draw(){
  background(0);
  PImage vid = a.getVideoImage();
  //image(vid,0,0);
  
  int s = 20 ;
  for(int x = 0 ; x <vid.width ; x += s){
    for(int y = 0 ; y <vid.height ; y += s){
       int i = x + y *width;   // index of the pixels
       float b = brightness(vid.pixels[i]); 
       float m =  map(b , 0,255,2,105);
       fill( 234,b, 255-b  ,255-b);
       noStroke();
       pushMatrix();
       translate(x,y);
       rotate(A);
       rect(0,0,m,m);
       popMatrix();
       
       A +=0.00001 ;
    }
  }
  
}