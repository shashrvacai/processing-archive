int dia = 45;
float a  =  0 ;
void drawCircle(float x_, float y_) {
  float dd = map(sin(a), -1, 1, 0, 2*PI);
  arc(x_, y_, dia, dia, 0, dd);
}

void setup() {

  size(600, 600);
  background(255);
  smooth();
}

void draw() {
  background(0);
  for (int i = dia; i < width; i+=dia*1.5) {
    for (int j = dia; j < width; j+=dia*1.5) {
      pushMatrix();
      translate(i, j);
      rotate(-a);
      drawCircle(0, 0);
       a+= 0.0001;
      popMatrix();
      
    }
   
  }
}