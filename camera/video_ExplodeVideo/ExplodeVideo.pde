import processing.video.*;

Movie m;
Capture v ;
PGraphics pg;
PImage img;       // The source image
int cellsize = 3; // Dimensions of each cell in the grid
int columns, rows;   // Number of columns and rows in our system

void setup() {



  size(1280, 720, P3D);
  smooth(2);
  pg = createGraphics(width, height, P2D);
 
  surface.setResizable(true);
  img = loadImage("A.jpg");  // Load the image
  
   m = new Movie(this, "iLs.mov");
  m.loop();

  //v = new Capture(this, 1280, 720, 30);
  //v.start();
}


void draw() {
 
  
  columns = m.width / cellsize;  // Calculate # of columns
  rows = m.height / cellsize;  // Calculate # of rows

  float aa = map(mouseX, 0 ,width , PI , -PI);
  if(mousePressed){
    println(aa);
  }
  //background(0);
  pg.beginDraw();
  pg.background(0);
  m.read();
  m.loadPixels();

  for ( int i = 0; i < columns; i++) {
    for ( int j = 0; j < rows; j++) {
      int x = i*cellsize + cellsize/2;  // x position
      int y = j*cellsize + cellsize/2;  // y position
      int loc = x + y*m.width;  // Pixel array location
      color c = m.pixels[loc];  // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (mouseX / float(width)) * brightness(m.pixels[loc]) - 20.0;
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
     
       rotateX(0.5);
        
      translate(x +100, y-150 , z-300);       
       
      fill(c);
      noStroke();
      rectMode(CENTER);
      ellipse(0, 0, cellsize, cellsize);
      popMatrix();
    }
  }
  m.updatePixels();
  pg.endDraw(); 
  image(pg, 0, 0, width, height);
}
