int num = 100;
int sw = 10;
float[] offSet = new float[num];
float offSetY = -150;
color bg = 20;
color s = #ffffff;
float theta, th;
color[] palette1 = {#a8ec26, #26dcec, #7d2fe7, #c22fe7, #e72f74};
color[] palette2 = {#ffa914, #e0f24a, #0b10f5, #f50bc1, #ffd76d};
color[] palette3 = {#26dcec, #45fff4, #ff4e00, #e72f74, #e0f24a};
color[] palette4 = {#e0f24a, #c22fe7, #a8ec26, #ff4e00, #ffa914};
int w = 500 ;

void setup() {
  size(1000, 1000);
  background(bg);
  noFill();
  strokeWeight(sw);

  for (int i=0; i<num; i++) {
    offSet[i]=th;
    th += (TWO_PI/num);
  }
}

void draw() {
  translate(0, 0);
  background(bg);
  stroke(s, 150);




  pushMatrix() ;
  for (int i=0; i<num; i++) {
    float y = ((100-offSetY)/(num-(num/20)))*i; // trying to get the lines starting off-screen
    float vari = map(sin(theta+offSet[i]*2), -1, 1, -120, 120);
    stroke(palette2[(int)i%5]);
    bezier(-sw, y, 0, y+vari, w, y-vari, w+sw, y);
  }
  popMatrix();

  pushMatrix() ;
  translate(0, 260);
  for (int i=0; i<num; i++) {
    float y = ((100-offSetY)/(num-(num/20)))*i; // trying to get the lines starting off-screen
    float vari = map(sin(theta+offSet[i]*2), -1, 1, -120, 120);
    stroke(palette1[(int)i%5]);
    bezier(-sw, y, 0, y+vari, w, y-vari, w+sw, y);
  }
  popMatrix();

  pushMatrix() ;
  translate(0, 510);
  for (int i=0; i<num; i++) {
    float y = ((100-offSetY)/(num-(num/20)))*i; // trying to get the lines starting off-screen
    float vari = map(sin(theta+offSet[i]*2), -1, 1, -120, 120);
    stroke(palette3[(int)i%5]);
    bezier(-sw, y, 0, y+vari, w, y-vari, w+sw, y);
  }
  popMatrix();

  pushMatrix() ;
  translate(0, 750);
  for (int i=0; i<num; i++) {
    float y = ((100-offSetY)/(num-(num/20)))*i; // trying to get the lines starting off-screen
    float vari = map(sin(theta+offSet[i]*2), -1, 1, -120, 120);
    stroke(palette4[(int)i%5]);
    bezier(-sw, y, 0, y+vari, w, y-vari, w+sw, y);
  }
  popMatrix();

  theta += 0.0523;

  pushMatrix();
  translate(width/2+28,65);
  pushMatrix() ;
  for (int i=0; i<num; i++) {
    float y = ((100-offSetY)/(num-(num/20)))*i; // trying to get the lines starting off-screen
    float vari = map(sin(theta+offSet[i]*2), -1, 1, -120, 120);
    stroke(palette2[(int)i%5]);
    bezier(-sw, y, 0, y+vari, w, y-vari, w+sw, y);
  }
  popMatrix();

  pushMatrix() ;
  translate(0, 260);
  for (int i=0; i<num; i++) {
    float y = ((100-offSetY)/(num-(num/20)))*i; // trying to get the lines starting off-screen
    float vari = map(sin(theta+offSet[i]*2), -1, 1, -120, 120);
    stroke(palette1[(int)i%5]);
    bezier(-sw, y, 0, y+vari, w, y-vari, w+sw, y);
  }
  popMatrix();

  pushMatrix() ;
  translate(0, 510);
  for (int i=0; i<num; i++) {
    float y = ((100-offSetY)/(num-(num/20)))*i; // trying to get the lines starting off-screen
    float vari = map(sin(theta+offSet[i]*2), -1, 1, -120, 120);
    stroke(palette3[(int)i%5]);
    bezier(-sw, y, 0, y+vari, w, y-vari, w+sw, y);
  }
  popMatrix();

  pushMatrix() ;
  translate(0, 750);
  for (int i=0; i<num; i++) {
    float y = ((100-offSetY)/(num-(num/20)))*i; // trying to get the lines starting off-screen
    float vari = map(sin(theta+offSet[i]*2), -1, 1, -120, 120);
    stroke(palette4[(int)i%5]);
    bezier(-sw, y, 0, y+vari, w, y-vari, w+sw, y);
  }
  popMatrix();
  popMatrix();
  theta += 0.0523;
}