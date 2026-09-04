import org.openkinect.processing.*;

Kinect2 K ;   // k in the kinect object
int jump = 10000;
long previousTime;
long currentTime;
float timeScale = 1; // Play with this to slow down or speed up the fluid (the higher, the faster)
final int fixedDeltaTime = (int)(10 / timeScale);
float fixedDeltaTimeSeconds = (float)fixedDeltaTime / 1000;
float leftOverDeltaTime = 0;
float xFactor = 3 ;
float yFactor = 3 ;
int count = 0 ;

GridSolver grid;

void setup () {
   fullScreen(P2D,2);
  // size(1920, 1080, P2D);
 // surface.setResizable(true);
  K = new Kinect2(this);
  K.initDepth();  // int depth ; 
   K.initRegistered();
  K.initDevice();

  colorMode(HSB, 255);
  noStroke();
  grid = new GridSolver(4);
}

void draw () {

  currentTime = millis();
  long deltaTimeMS = (long)((currentTime - previousTime));
  previousTime = currentTime; 
  
  int timeStepAmt = (int)(((float)deltaTimeMS + leftOverDeltaTime) / (float)(fixedDeltaTime));

  leftOverDeltaTime += deltaTimeMS - (timeStepAmt * (float)fixedDeltaTime); 

  if (timeStepAmt > 15) {
    timeStepAmt = 15; // too much accumulation can freeze the program!
    println("Time step amount too high");
  }

  // Update physics
  for (int iteration = 1; iteration <= timeStepAmt; iteration++) {
    grid.solve(fixedDeltaTimeSeconds * timeScale);
  }

  grid.draw();
    

  PImage dep =  K.getRegisteredImage();  // depth img
  int[]  Rdep = K.getRawDepth();

  int s = 5;    // skip
  for (int x = 0; x < dep.width; x+=s) {
    for (int y = 0; y < dep.height; y+=s) {
      int  i = x + y* dep.width;    // index 
      float b = brightness(dep.pixels[i]);  
      int d = Rdep[i];   // depth index
      float n = map(d, 175, 1050, 0, 255);
     

      if (d <2050 && d >175) {
        fill(n, 0, 255-n, n);
        noStroke();
        // ellipse(x, y, 2, 2);
      

        if (count % jump == 0) {
          float force = 2500;
          if (((int)(x*xFactor/ grid.cellSize) < grid.density.length) && ((int)(y*yFactor / grid.cellSize) < grid.density[0].length) &&
            ((int)(x*xFactor/ grid.cellSize) > 0) && ((int)(y*yFactor/ grid.cellSize) > 0)) {
            grid.velocity[(int)(x*xFactor / grid.cellSize)][(int)(y*yFactor/ grid.cellSize)] += force;
          }
        }
      }
    }
  }
  
  if (count >500){
    setup();
  }
}
