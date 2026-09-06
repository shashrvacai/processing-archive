import processing.video.*;
//Movie a;

float Scoe = 1; 


PImage a;

void setup() {
  size(1024, 1024);
  tint(255);
 a = loadImage("fire.png");
 //a.filter(GRAY);
 //a.speed(0.05);
 //a.loop();
  frameRate(0.2);
 // a.volume(0);
  //image(a, 0, 0);
}

int index(int x, int y) {
  return x + y * a.width;
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  
//  a.loadPixels();
  for (int y = 0; y < a.height-1; y++) {
    for (int x = 1; x < a.width-1; x++) {
      color pix = a.pixels[index(x, y)];
      float oldR = red(pix);
      float oldG = green(pix);
      float oldB = blue(pix);
      int factor = 1;
      int newR = round(factor * oldR / 255) * (255/factor);
      int newG = round(factor * oldG / 255) * (255/factor);
      int newB = round(factor * oldB / 255) * (255/factor);
      a.pixels[index(x, y)] = color(newR, newG, newB);

      float errR = oldR - newR;
      float errG = oldG - newG;
      float errB = oldB - newB;


      int index = index(x+1, y  );
      color c = a.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      r = r + errR * Scoe/16.0;
      g = g + errG * Scoe/16.0;
      b = b + errB * Scoe/16.0;
      a.pixels[index] = color(r, g, b);

      index = index(x-1, y+1  );
      c = a.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR *Scoe/16.0;
      g = g + errG * Scoe/16.0;
      b = b + errB * Scoe/16.0;
      a.pixels[index] = color(r);

      index = index(x, y+1);
      c = a.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR *Scoe/16.0;
      g = g + errG * Scoe/16.0;
      b = b + errB * Scoe/16.0;
      a.pixels[index] = color(r);


      index = index(x+1, y+1);
      c = a.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * Scoe/16.0;
      g = g + errG * Scoe/16.0;
      b = b + errB * Scoe/16.0;
      a.pixels[index] = color(r);
    }
  }
  a.updatePixels();
  //scale(2);
  image(a, 0, 0);
}

void mousePressed(){
saveFrame("line-######.png");
}
