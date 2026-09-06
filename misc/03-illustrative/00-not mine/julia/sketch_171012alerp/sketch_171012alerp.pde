

color from =  color(255, 35, 150);
color to =  color(55, 135, 15);
int s = 20 ;
float A = 20 ; 

void setup() {
  size(600, 600);
  background(255);
  rectMode(CENTER);
}

void draw() {



for (int i = 0; i <= 10; i++) {
  for (int j = 0; j <= 10; j++) {
  float x = lerp(0, 3*width, i/30.0) ;
  float y = lerp(0, 5*height, j/A);
   float C = map(y , 0,width,0,1);
  color c = lerpColor(from,to,C);
  stroke(255-c);
  fill(c);
  rect(x,y,10*j,j);
  A += 0.2;
  }
}
}