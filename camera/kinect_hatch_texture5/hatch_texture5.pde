import org.openkinect.processing.*;

Kinect2 K ;   // k in the kinect object
Pice P ;
boolean R = false ;


void setup() {
  size(1536, 1272);
  K = new Kinect2(this);
  P =  new Pice();

  K.initDepth();  // int depth ; 
  K.initDevice();
}

void keyPressed() {
  if (key == 'r'|| key == 'R') {
    R = !R ;
  }
}

void draw() {
  scale(3);
  background(255);

//  blendMode(DIFFERENCE); // SUBTRACT , MULTIPLY ,  SCREEN , ADD
//  


  PImage dep =  K.getDepthImage();  // depth img
  //image(dep,0,0);   // test depth image
  int[]  Rdep = K.getRawDepth();



  float s = 2;    // skip
  float r = 2;    // range
  for (int x = 0; x < dep.width; x+=s) {
    for (int y = 0; y < dep.height; y+=s) {
      int  i = x + y* dep.width;    // index 
      float b = brightness(dep.pixels[i]);  
      int d = Rdep[i];   // depth index
      float n = map(d, 450, 1250, 10, 255);
      float si = map(n,0,255,s*r,s/r);
      //float si = map(n, 0, 255, s*r, s/r);   ///reverse

      float m = map(b, 0, 255, 8, 50); // mapping brightness values 

      if (d >450 && d <2750) {
        //fill(n,0,255-n,255);   // red to blue
        //fill(0,n,255-n,255);   //  blue to green
        //fill(255-n,n,255,255);   //  blue to purple
        //fill(255,n,255-n,255);   // orange to Yellow
        fill(255, 255-n, n, 255);   // pink to orange
        noStroke();
        //strokeWeight(0.5);
        //stroke(0,n); 
        ellipse(x, y, si, si);
      } else {
        fill(0);
        //rect(x,y, m, m);
      }
    }
    
  }
  if (R) {
    saveFrame("output/HT####.png");
    fill(255, 0, 0);
  } else {
    fill(0, 255, 0);
  }
  ellipse(width/2, height/2, 20, 20);
}