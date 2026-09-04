import processing.sound.*;

import org.openkinect.processing.*;

Kinect2 K ;   // k in the kinect object

boolean R = false ;
float t ;
Amplitude amp ;
AudioIn in ;
int depthB = 450 ;
int depthE =1250 ;

void setup() {
  size(1536, 1272);
  surface.setResizable(true);
  
  
  K = new Kinect2(this);
  K.initDepth();  // int depth ; 
  K.initDevice();
  
  amp = new Amplitude(this);
  in = new AudioIn(this,0);
  in.start();
  amp.input(in);
  
  t = 0 ;
}

void keyPressed() {
  if (key == 'r'|| key == 'R') {
    R = !R ;
  }
}

void draw() {
  float aa = amp.analyze()*10;    /// audio mapping 
  float a = map(aa,0,0.7,-10,10); 
  
  scale(2);
  background(255);

//  blendMode(DIFFERENCE); // SUBTRACT , MULTIPLY ,  SCREEN , ADD
//  


  PImage dep =  K.getDepthImage();  // depth img
  //image(dep,0,0);   // test depth image
  int[]  Rdep = K.getRawDepth();


  
  float s = 3;                              // skip
  float r = 2;                              // range
  for (int x = 0; x < dep.width; x+=s) {
    for (int y = 0; y < dep.height; y+=s) {
      int  i = x + y* dep.width;    // index 
      float b = brightness(dep.pixels[i]);  
      int d = Rdep[i];   // depth index
      float n = map(d,depthB, depthE, 10, 255);
      float q = map(d,depthB ,depthE ,1,15*aa);
      float si = map(n,0,255,s*r,s/r);
      //float si = map(n, 0, 255, s*r, s/r);   ///reverse

    float x1 = q*20 *sin(t);
    float y1 = q*20 *cos(t);

      if (d >450 && d < 1750) {
        //fill(n,0,255-n,255);   // red to blue
        //fill(0,n,255-n,255);   //  blue to green
        fill(255-n,n,255);   //  blue to purple
        //fill(255,n,255-n,255);   // orange to Yellow
        //fill(255, 255-n, n, 255);   // pink to orange
        noStroke();
        //strokeWeight(0.5);
        //stroke(0,n); 
        ellipse(x+x1, y-y1, si*q, si*q);
      } else {
        fill(0);
        //rect(x,y, m, m);
      }
    }    
  }
  
  t +=  aa/10 ;
  
  
  
  
  
  
  if (R) {
    saveFrame("output/HT####.png");
    fill(255, 0, 0);
  } else {
    fill(0, 255, 0);
  }
  ellipse(width/2, height/2, 20, 20);
  
  
}