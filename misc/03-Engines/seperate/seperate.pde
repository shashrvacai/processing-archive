import processing.sound.*;
Amplitude amp;
AudioIn in;

ArrayList<orb> O ;

float xoff ;
float yoff ;



void setup() {
  size(1200, 1200);
  background(0);

  O = new ArrayList<orb>();
  for (int i = 0; i < 1200; i ++ ) {
    O.add(new orb(random(width), random(height)));
  }
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
}


void draw() {
   float aa = map(amp.analyze(),0,0.5,0,15);
  fill(0, 15);
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
