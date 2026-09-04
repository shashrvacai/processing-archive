float YConst = 10 ;   // starting  dist along the Y axis
float skip  ;    
float inc = 5;        // increment in the distance
float Xdist =40;      //dist between the x co-ordinates

color top = color(100, 304, 200);        // color 1
color bottom =  color(255, 77, 148);      // color 2


void setup() {
  size(1000, 600);
  background(0);    // color of the BG 

 
}

void draw(){
  translate(width,height);
  rotate(PI);
  background(0); 
  float mou = map(mouseX,0,width,-1,1);
  for (int x = 0; x< width; x+= Xdist) {     
    skip = YConst ;                   
    OneLine(x, mou);
  }

}

void OneLine(float x_, float mou_) {
  float nve = 1 ;
  for (int y = 0; y< height; y+= skip) {
    
    float C = map(y, 0, height, 0, 1);
    color c = lerpColor(top, bottom, C);
    fill(c);
    stroke(c);
    strokeWeight(15);
    line(x_+((Xdist*mou_)*(-nve)),y,x_+((Xdist*mou_)*nve) ,y +(skip+2*inc));
   // ellipse(x_, y, 10, 10);       //    the form you want
    skip += 2*inc;
    nve*= -1 ;
  }
}