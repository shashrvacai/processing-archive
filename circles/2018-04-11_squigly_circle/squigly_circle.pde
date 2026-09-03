
int num =40;
float step, sz, offSet, t, angle;
float r = 0f;
float inc = 0.01f;
void setup() {
  size(600, 600);
  strokeWeight(5);
  step = 14;
  smooth();
}

void draw() {
  noStroke();
  fill(20,20);
  rect(0,0,width,height);
  noFill();
  
  translate(width/2, height*.5);
  rotate(r);
  angle=0;
  for (int i=0; i<num; i++) {
    float ss = map(num , 0 ,40,0,255);
    stroke(255 - (200* (i / (float)num)),ss);
    noFill();
    sz = i*step;
    float offSet = TWO_PI/num*i;
    float arcEnd = map(sin(t+offSet),-1,1, TWO_PI*1.25,PI/2*1.5);
    arc(0,0, sz, sz, arcEnd*0.5, arcEnd);
    arc(0,0, sz, sz, arcEnd, arcEnd*0.25);
  }
 // colorMode(RGB);
  resetMatrix();
  t+= .05;
  r += inc;
}