//   this one is a lil more complex .. but the possibilities are immense
//   mouse click will save the image in the sama folder ..
//  change 



float r = 10 ;            // raduis of the   firstt row circles 
float skip = 20 ;         //  X and Y spacing for the first row 
float inc  = 10;          // increse in raduis along the Y-axis   
float incX = 10;            // this parameter is ambiguos , it chanfges ... try diff values 
float skip2 =  skip+ incX;   

color top = color(200, 15, 200);        // color 1
color bottom =  color(10, 177, 150);     // color 2 


void setup() {
  size(1600, 1000);     //    size of the frame 
  background(0);         
  ellipseMode(LEFT);       //   the alignment  the center of the circle 
  oneLine(5);             //    starting of the position at X  axis
}

void oneLine(float x_) {   
  noStroke();
  for (int y = 10; y < height; y+= skip) {
    for (int i  = 1; i < height; i++) {

      float C = map(y, 0, height, 0, 1);
      color c = lerpColor(top, bottom, C);

      fill(c);
      ellipse(x_, y, r, r);
      ellipse(x_  + skip2*i, y, r, r);
    }
    skip2 += incX ;
    skip += inc ; 
    r+= inc ;
  }
}

void mousePressed(){
  saveFrame("diagonal####.png");    // change the name of the fill

}