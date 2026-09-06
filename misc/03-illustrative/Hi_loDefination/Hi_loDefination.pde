PVector w ;
PVector rootn;
float xS = 40;
float yS = 6 ;
PFont font, font1 ;

void setup() {
  size(1200, 1200, P2D);
  font = createFont("HelveticaNeue-Bold", 100);
  font1 = createFont("HelveticaNeue-BoldItalic", 100);
  w = new PVector(0, 0);
  rootn = new PVector(random(100), random(100));
}

void draw() {
  background(0);
  
  noFill();
  stroke(2);
  float dx = map(mouseX, 0, width, -2, 2);
  float dy = map(mouseY, 0, height, 2, -2);
  xS = map(mouseX, 0, width, 3, 140);
  if (abs(dx) < .3) dx = 0;
  if (abs(dy) < .3) dy = 0;
  w.sub(new PVector(dx, dy));  
  rootn.add(new PVector(.009*dx, .009*dy));
  for (int j = 0; j < height; j+= yS) {
    beginShape();
    for (int i = 0; i < width; i += xS) {
      float n = noise(rootn.x+0.019*i, rootn.y + 0.02*j );
      float tt = 100*(n-1)+j;
      stroke(map(n, .25, 1, 0, 255));
      strokeWeight(map(mouseX, 0,width, 1,2));
      vertex(i, height- tt);
    }
    endShape();
  }
  noStroke();
  fill(0);
  rect(width-200, 0, 400, height);
  rect(0, (3*height)/4, width, height);
  rect(0, 0, 400, height);
  
textAlign(RIGHT);
fill(255);
textFont(font);
textSize(100);
float xx= map(mouseX , 0,width, height/2,height/2-100 );
fill(255,map(xx,height/2,height/2-100 ,255,0));
text("hi", 390, xx);
fill(255,map(xx,height/2,height/2-100 ,0,255));
text("lo", 390, xx+100);




textAlign(RIGHT);
fill(255,202,202);
textFont(font1);
textSize(100);
text("def", 560, height/2);
textSize(50);
text("n", 600, height/2-50);
  
}