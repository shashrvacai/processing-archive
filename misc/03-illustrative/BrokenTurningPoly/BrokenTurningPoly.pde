float n =4;
float a = 0;
float r =  0;
float H, W ;


void setup() {
  size(1000, 1000);
  surface.setResizable(true);
  background(0);
}

void draw() {
  fill(0, 15);
  rect(0, 0, width, height);
  //noFill();
  H = height/4;
  W = width/4;

  stroke(255);
  strokeWeight(5);
  fill(0);
  blendMode(BLEND);

  for (float v = W; v < width+10; v+= W) {
    pushMatrix();
    drawPolyGrp(v, v);
    translate(W, 0);    
    popMatrix();
  }
  pushMatrix();
  drawPolyGrp(0, 0);
  popMatrix();
  
  pushMatrix();
  drawPolyGrp(2*W, 0);
  popMatrix();
  
  pushMatrix();
  drawPolyGrp(3*W,H);
  popMatrix();
  
  pushMatrix();
  drawPolyGrp(4*W, 2*H);
  popMatrix();
  
  pushMatrix();
  drawPolyGrp(5*W, 3*H);
  popMatrix();
  
  pushMatrix();
  drawPolyGrp(0, 2*H);
  popMatrix();
  
  pushMatrix();
  drawPolyGrp(4*W, 0);
  popMatrix();
  
  pushMatrix();
  drawPolyGrp(2*W, 4*H);
  popMatrix();
  
  pushMatrix();
  drawPolyGrp(W, 3*H);
  popMatrix();
  
  pushMatrix();
  drawPolyGrp(0, 4*H);
  popMatrix();
 

  a+= 0.05 ;       // turning speed
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

void drawPolyGrp(float W_, float H_) {

  translate(W_, H_);
  for (int i = width/4; i > 0; i-= 15) {
    float SW =  map(i, 0, width, 0.01, 20);
    strokeWeight(SW);
    float A = map(sin(a), -1, 1, radians(88), radians(92));
    //float A = map(mouseX, 0,width,radians(87),radians(93));     /// debugger 
    if ((i <= (W)/3)||(i >= (W-(W)/3))) {
      rotate(2*A);
    } else {
      rotate(-A);
    }   
    int N = floor(n);
    polygon(0, 0, i, N);
  }
}