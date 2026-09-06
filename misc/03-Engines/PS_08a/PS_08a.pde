import processing.sound.*;

ArrayList<PS> s ;
Amplitude amp ;
AudioIn in ;

PImage img ;

void setup() {
  size(1000, 1000);

  img = loadImage("texture.png");
  s = new ArrayList<PS>();

  amp = new Amplitude(this);
  in = new AudioIn(this, 0);  
  in.start();
  amp.input(in);
}

void draw() {
  float a = amp.analyze();
  background(0);
  float dx = map(a, 0, 0.05, -0.1, 0.1);   // map value
  PVector w = new PVector(0, -dx);
  //PVector w_ = new PVector(0, dx);

  for (PS Ps : s) {
    Ps.aF(w);
    Ps.run();

    for (int i = 0; i < 2; i++) {
      Ps.aP();
    }
  }
}

void mousePressed(){
  s.add(new PS(0, new PVector(mouseX,mouseY),img));
}