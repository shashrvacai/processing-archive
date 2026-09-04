int num=50, movers=50, d3=50, frames=150;
float angle, theta, d, d2;
color bg=#202020;

void setup() {
  size(540, 540,P2D);
  smooth(5);
}

void draw() {
  randomSeed(455);
  background(bg);
  noFill();

  for (int i=0; i<num; i++) {
    angle = TWO_PI/num*i;
    d = map(sin(theta+angle*5), -1, 1, 150, 200);
    float outerX = width/2 + cos(angle)*d; 
    float outerY = height/2+sin(angle)*d;
    float cx1 = width/2 + cos(angle)*d*.8; 
    float cy1 = height/2+sin(angle)*d*.8;
    d2 = map(sin(theta+angle*2), -1, 1, 0, 75);
    for (int j=0; j<movers; j++) {
      float offSet = TWO_PI/movers*j;
      float CmoverX = width/2+cos(theta+offSet)*d2;
      float CmoverY = height/2+sin(theta+offSet)*d2;
      CmoverY = abs(CmoverX);
      float moverX = CmoverX + cos(angle)*d3;
      float moverY = CmoverY + sin(angle)*d3;
      float cx2 =  CmoverX + cos(angle)*d3;
      float cy2 = CmoverY + sin(angle)*d3;
      noFill();
      stroke(#ffffff, 50);
      bezier(outerX, outerY, cx1, cy1, cx2, cy2, moverX, moverY);
    }
  }
  theta += TWO_PI/frames;

  //if (frameCount<=frames) saveFrame("image-###.gif");
}