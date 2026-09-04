import processing.sound.*;
//import spout.*;


//Spout spout;

Amplitude  amp ;
AudioIn in ;

void setup() {
  //spout = new Spout(this);

  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in. start();
  amp.input(in);

}

void draw() {
  float aa =  amp.analyze();
  //spout.sendTexture();
}
