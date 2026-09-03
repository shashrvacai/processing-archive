
import oscP5.*;
OscP5 oscP5;
OpenSimplexNoise n ;
nGrid N ;

float n1 =  4, n2 =  4;

void setup() {
  size(1200, 1200);
  frameRate(30);
   oscP5 = new OscP5(this, 9600); 
   N = new nGrid();
 
}

void draw() {
  background(0);
  noCursor();
   N.render();
}
