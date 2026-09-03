
 
float increment = 0.005;
// The noise function's 3rd argument, a global variable that increments once per cycle
float zoff = 0.0;  
// We will increment zoff differently than xoff and yoff
float zincrement = 0.02; 

OpenSimplexNoise n ;

void setup() {
  size(1200, 640);
  frameRate(30);
  
  n = new  OpenSimplexNoise();
}

void draw() {
  
  loadPixels();
  float xoff = 0.0; // Start xoff at 0
  
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < height; y++) {
      yoff += increment; // Increment yoff
      
      // Calculate noise and scale by 255
     float bright = (float)n.eval(xoff,yoff,zoff)*55;
      //float bright = (float) n.eval(xoff,yoff,zoff);
      float Bmapped = map(bright, -1,1,0,255);

      // Try using this line instead
      //float bright = random(0,255);
      
      // Set each pixel onscreen to a grayscale value
      pixels[x+y*width] = color(Bmapped,Bmapped,Bmapped);
    }
  }
  
  updatePixels();
  
  zoff += zincrement; // Increment zoff
  
  
}
