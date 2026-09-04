import processing.sound.*;
import processing.video.*;
Amplitude amp;
AudioIn in;
Capture grab;
PImage Buffer ;

ArrayList<orb> O ;

float xoff ;
float yoff ;

color black = color(0);
color white = color(255);
int numPixels;


void setup() {
  size(1280, 720);
  background(0);


  grab = new Capture(this, 1280, 720);
  grab.start();
  Buffer=  new PImage(grab.width, grab.height);

  numPixels = grab.width * grab.height;
  noCursor();
  smooth();

  O = new ArrayList<orb>();
  for (int i = 0; i < 3200; i ++ ) {
    O.add(new orb(random(width), random(height)));
  }

  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

void draw() {
  if (grab.available()) {
    grab.read();
    grab.loadPixels();
    int threshold =70;  // ----------------------------------------------------------------Set the threshold value
    float pixelBrightness; // Declare variable to store a pixel's color
    // Turn each pixel in the video frame black or white depending on its brightness
    loadPixels();
    for (int i = 0; i < numPixels; i++) {
      pixelBrightness = brightness(grab.pixels[i]);
      if (pixelBrightness > threshold) { // If the pixel is brighter than the
        Buffer.pixels[i] = white; // threshold value, make it white
      } else { // Otherwise,
        Buffer.pixels[i] = black; // make it black
      }
    }
    updatePixels();
  }


  float aa = map(amp.analyze(), 0, 0.5, 5, 15);       // ------------------------sep value
  fill(0, 10);
  rect(0, 0, width, height);
  noFill();

  float x = map(noise(xoff), 0, 1, 0, width);
  float y = map(noise(yoff), 0, 1, 0, height);

  noStroke();
  fill(255);
  //ellipse(x, y, 20, 20);

  xoff += 0.01 ;
  yoff += 0.02 ;

  for (orb oo : O) {
    oo.seperate(O, aa);
    oo.update(aa);
    oo.borders();
    oo.show();
  }
}
