float x, y, t, theta;
int points = 50, num = 56, num2= 28, frms = 20;

void setup() {
  size(540, 540, P2D);
  smooth(8);
  noStroke();
}

void draw() {
  background(255);
  for (int j = 0; j< num; j++) {
    float offSet = TWO_PI/num*j;
    pushMatrix();
    translate(width/2, height/2);
    rotate(PI+offSet+theta);
    pushMatrix();
    translate(0, -180);
    fill(0);
   if (j == 24) fill(255,0,0);
    float sz = map(sin(theta+offSet*3),-1,1,30,60);
    beginShape();
    for (int i=0; i<points; i++) {
      t = TWO_PI/points*i;
      x = (sin(t) < 0) ? sin(t) * sz : -sin(t) * sz*.8;
      y = cos(t) * sz;
      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();
    popMatrix();
  }

  for (int j = 0; j< num2; j++) {
    float offSet = TWO_PI/num2*j;
    pushMatrix();
    translate(width/2, height/2);
    rotate(PI+offSet-theta);
    pushMatrix();
    translate(0, -70);

    fill(0);
if (j == 20) fill(255,0,0);
    beginShape();
    for (int i=0; i<points; i++) {
      t = TWO_PI/points*i;
      x = (sin(t) < 0) ? sin(t) * 30 : -sin(t) * 25;
      y = cos(t) * 30;
      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();
    popMatrix();
  }

  theta += TWO_PI/num2/frms;
  //if (frameCount<=frms*5) saveFrame("image-###.gif");
}