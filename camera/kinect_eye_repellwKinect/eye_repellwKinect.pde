import org.openkinect.processing.*;
Kinect2 K ;   // k in the kinect object

boolean R = false ;
float dMin =1400 ;
float dMax = 1900 ;

ArrayList<orb> O ;

void setup() {
  background(0);
 
  size(1920, 1080);
  surface.setResizable(true);
  K = new Kinect2(this);
  K.initDepth();  // int depth ; 
  K.initDevice();


  O = new ArrayList<orb>();
  for (int i = 0; i < 100; i ++ ) {
    O.add(new orb(random(width), random(height)));
  }
}


void draw() {
  pushMatrix();
  fill(0);
  rect(0, 0, width, height);
  noFill();
  popMatrix();
  
  PImage dep =  K.getDepthImage();  // depth img
  //image(dep,0,0);   // test depth image
  int[]  Rdep = K.getRawDepth();
  
    float sX = 0 ;   /// sum of X 
  float sY = 0 ;   /// sum of Y
  float tP = 0 ;   /// total number of pixels 
   
    float s = 4;    // skip
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
        float X = map(x , 0, dep.width, 0 , 1920);
        float Y = map(y , 0, dep.width, 0 , 1380);
        //ellipse(X, Y, si, si);
        sX += X ;
        sY += Y ;
        tP ++ ;
      } else {
      }
    }
  }

  float aX = sX /tP ;
  float aY = sY /tP ;
  fill(125);
 // ellipse(aX, aY, 20, 20);
    
    
   /// --------------------------------- eyes
   
   
  
  noStroke();
  fill(255);

  for (orb oo : O) {
    oo.updateEye(int(aX),int(aY));
    oo.seperate(O );
    oo.update();
    oo.borders();
    oo.show();
  }
}
