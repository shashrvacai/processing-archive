import org.openkinect.processing.*;

Kinect2 K ;   // k in the kinect object
int dMax=  1250, dMin = 280 ;
int w, h ;
PImage g ;

void setup() {
  size(1536, 1272);
  surface.setResizable(true);
  K = new Kinect2(this);


  K.initDepth();  // int depth ; 
  K.initVideo();



  K.initDevice();
}

void draw() {

  background(255);

  g = K.getVideoImage() ;
  PImage dep =  K.getDepthImage();
  println(g.width, g.height, dep.width, dep.height);

  int[]  Rdep = K.getRawDepth();

  // g.resize(dep.width,dep.height );
  //image(g, 0, 0);

  float s = 3;    // skip
  float r = 2;    // range  

  for (int x = 0; x < dep.width; x++) {
    for (int y = 0; y < dep.height; y++) {

      int  i = x + y* dep.width;    // index 
      //   float b = brightness(dep.pixels[i]); 
      int d = Rdep[i];   // depth index
      //    float n = map(d, dMax, dMin, 10, 255);
           float X = map(x, 0 ,dep.width, 0, g.width);
           float Y = map(y, 0 ,dep.height,0 ,g.height);

          color c = g.get(int(X),int(Y)) ;
          fill(c);
          if (d >dMin && d <dMax) {
            pushMatrix(); 
            //scale(3.7,2.5);
            noStroke();

            ellipse(X, Y, 4, 4);
            popMatrix();
          }
        }
      }

}
