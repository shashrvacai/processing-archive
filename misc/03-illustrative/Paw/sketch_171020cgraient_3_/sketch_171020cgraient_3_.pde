float YConst = 10 ;   // starting  dist along the Y axis

float skip = YConst ;    
float inc = 5;        // increment in the distance
float Xdist = 25;      //dist between the x co-ordinates

color top = color(100, 304, 200);        // color 1
color bottom =  color(200, 177, 5);      // color 2


void setup() {
  size(600, 600);
  background(0);    // color of the BG 



  for (int x = 0; x< width; x+= Xdist) {     

    skip = YConst ;                   
    OneLine(x);
  }
}


void OneLine(float x_) {


  for (int y = 0; y< height; y+= skip) {

    float C = map(y, 0, height, 0, 1);
    color c = lerpColor(top, bottom, C);
    fill(c);
    ellipse(x_, y, 10, 10);       //    the form you want
    skip += inc;
  }
}