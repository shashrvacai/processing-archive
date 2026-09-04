import processing.video.*;

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
  
  v = new Capture(this,1280,720 ,30);
  v.start();
}


void draw() {
 // v.read();
  
  columns = v.width / cellsize;  // Calculate # of columns
  rows = v.height / cellsize;  // Calculate # of rows
  
  

  //background(0);
  pg.beginDraw();
  pg.background(0,2);
  v.read();
  v.loadPixels();
  
  for ( int i = 0; i < columns; i++) {
    for ( int j = 0; j < rows; j++) {
      int x = i*cellsize + cellsize/2;  // x position
      int y = j*cellsize + cellsize/2;  // y position
      int loc = x + y*v.width;  // Pixel array location
      color c = v.pixels[loc];  // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (mouseX / float(width)) * brightness(v.pixels[loc]) - 20.0;
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x + 200, y + 100, z);
      fill(c);
      noStroke();
      rectMode(CENTER);
      ellipse(0, 0, cellsize, cellsize);
      popMatrix();
    }
  }
  v.updatePixels();
  pg.endDraw(); 
  image(pg, 0, 0, width, height);

}
