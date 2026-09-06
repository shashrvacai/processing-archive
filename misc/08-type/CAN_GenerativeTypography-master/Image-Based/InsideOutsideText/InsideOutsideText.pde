import oscP5.*;
OscP5 oscP5;

/*
 * USAGE:
 * - move the mouse around to change the grid dimensions
 * - click the mouse to flip the drawing method used for respectively inside and outside the text  
 */

color ELLIPSE_COLOR = color(0); 
color LINE_COLOR = color(0, 125); 
color PGRAPHICS_COLOR = color(0); 
int LINE_LENGTH = 25; // length of drawn lines
boolean reverseDrawing = false; // boolean to flip the drawing method (toggle with mouse)
PGraphics pg;

float pT1 =  1.0, pT2 =  0.5, pT3 = 0 ;

void setup() {
  size(1920, 1080);
  oscP5 = new OscP5(this, 9600);   
  pg = createGraphics(width, height, JAVA2D);
  pg.beginDraw();
  pg.textSize(200);
  pg.textAlign(CENTER, CENTER);
  pg.fill(PGRAPHICS_COLOR);
  //pg.text("all work", pg.width/2, pg.height/4); 
  pg.text("Cai", pg.width/2, pg.height/2); 
  //pg.text("all work", pg.width/2, pg.height/4); 
  //pg.text("is made by", pg.width/2, 3*pg.height/4); 
  pg.endDraw();
}

void draw() {
  int gridHorizontal = (int) pT1 ; // number of horizontal grid cells (based on mouseX)
  int gridVertical = (int) pT2; // number of vertical grid cells (based on mouseY)
  float w = float(width) / gridHorizontal;
  float h = float(height) / gridVertical;
  float r = min(w, h);

  // draw shapes to the screen
  background(255);


  //ellipse(xx,yy, 50,50);
  strokeWeight(0.5);
  for (int y=0; y<gridVertical; y++) {
    for (int x=0; x<gridHorizontal; x++) {
      float e_x = x * w;
      float e_y = y * h;
      color c = pg.get(int(e_x), int(e_y)); // get PGraphics color at this coordinate
      boolean textDrawn = (c == PGRAPHICS_COLOR); // is the color equal to PGRAPHICS_COLOR (aka is there text here)
      // use the reverseDrawing boolean to flip the textDrawn boolean
      // thus in fact flipping the resulting displayed shapes
      if (reverseDrawing ? !textDrawn : textDrawn) {
        noStroke();
        fill(ELLIPSE_COLOR);
        if (pT3 == 0) {
          rect(e_x, e_y, r, r);
        } else {
          ellipse(e_x, e_y, r, r);
        }
      } else {
        stroke(LINE_COLOR);
        //line(e_x, e_y, e_x + LINE_LENGTH, e_y + LINE_LENGTH);
      }
    }
  }
}

void mousePressed() {
  reverseDrawing = !reverseDrawing; // toggle boolean for drawing method
}
