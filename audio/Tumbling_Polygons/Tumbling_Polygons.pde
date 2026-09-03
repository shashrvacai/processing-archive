float oX, oY, x, y, sz, a ;
float sc = 0.9 ;
int num = 50;

void setup() {
  size(1000, 1000);
  background(140);


  strokeWeight(0.8);

  oX = 0 ;
  oY = 0 ;
  sz = width/1.5*.8 ;
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}


void draw() {
  background(0);
  //ellipse(oX, oY , sz,sz);
  pushMatrix();
  translate(width/2, height/2);

  for (int i = 0; i < num; i++) {
    float red = map(i, 0, num, 50, 255);
    rotate(a/32);
    float diam = sz*pow(sc, i);    // reduction factor 
    float offSet = sz/2 - diam/2 ;
    x = oX +sin(a)*offSet ;
    y = oY + cos(a/2.2)* offSet ;
    //ellipse(x,y,diam , diam);
    fill(red);
    stroke(15,red);
    polygon(x, y, diam/2, 3 );
  }
  a += 0.02 ;
  popMatrix();
 
}