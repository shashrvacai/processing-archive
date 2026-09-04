import processing.sound.*;
import processing.video.*;
Amplitude amp;
AudioIn in;
Capture grab;

ArrayList<orb> O ;

float xoff ;
float yoff ;



void setup() {
  size(1280, 720);
  background(0);

  grab = new Capture(this, 1280, 720);
  grab.start();

  O = new ArrayList<orb>();
  for (int i = 0; i < 1200; i ++ ) {
    O.add(new orb(random(width), random(height)));
  }
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
}

void captureEvent(Capture video) {
  video.read();
}


void draw() {
   float aa = map(amp.analyze(),0,0.5,5,15);       // sep value
  fill(0, 2);
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
    oo.seperate(O , aa);
    oo.update(aa);
    oo.borders();
    oo.show();
  }
}
