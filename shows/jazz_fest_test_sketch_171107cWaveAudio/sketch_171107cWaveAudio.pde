import processing.sound.*;

PVector xx, yy, fcx, fcy, sx, sy;
int seed = 0, cell = 16;
Boolean randomized = true;
Amplitude amp ;
AudioIn in ;

void setup() {
  size(750, 450, P2D);
  strokeWeight(3);
  initialize();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

void initialize() {
  seed += frameCount*200;
  randomSeed((int)random(1000) + frameCount);
  xx = new PVector(random(0, 110), random(10, 110));
  yy = new PVector(random(10, 110), random(10, 110));
  sx = new PVector(random(30, 70), random(30, 70));
  sy = new PVector(random(140, 70), random(30, 70));
  fcx = new PVector(random(20, 70), random(20, 70));
  fcy = new PVector(random(20, 70), random(20, 70));
}

void draw() {
  float aa = amp.analyze();
  float ma = map(aa,0,50,-10,10);
  noStroke();
  fill(1, 13);
  rect(0, 0, width, height);

  randomSeed(seed);

  float fc = float(frameCount+1);
  stroke(255, 79, 150);
  float x, y, maxx, minx, maxy, miny;
  for (float i = 0; i < width; i += cell)
  {
    for (float j = 0; j < height; j += cell)
    {
      x = randomized ? random(width) : i;
      y = randomized ? random(height) : j;
      maxx =  xx.x * (1 + sin(y/sx.x*aa + 2*fc/fcx.x*aa)) + width;
      minx = -xx.y * (1 + sin(y/sx.y*aa + fc/fcx.y));
      x = map(x, 0, width, minx, maxx);
      if (x > 0 && x < width) {
        maxy =  yy.x * (1 + sin(x/sy.x + fc/fcy.x)) + height;
        miny = -yy.y * (1 + sin(x/sy.y + fc/fcy.y));
        y = map(y, 0, height, miny, maxy);
        if (y > 0 && y < height)
          point(x, y);
      }
    }
  }
}

void mousePressed() {
  initialize();
}

void keyPressed() {
  randomized = !randomized;
}