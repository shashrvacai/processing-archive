import processing.sound.*;

SoundFile Sf ;
Amplitude amp;
GlitchObject myGlitch;
boolean glitch = true;

void setup() {
  size(600, 600);                                      // size of the project (x,y)
  rectMode(CENTER);                                   // rect  Mode 
  Sf = new SoundFile(this, "Prg85.mp3");             // load soundFile || need to replace with AudioIn 
  amp = new Amplitude(this);                          // var for amp 

  //Sf.play();                                        // Play once
  Sf.loop();                                          // Play in a loop
  amp.input(Sf);                                      // input for amplitude
}

void draw() {

  background(0);
  fill(255);
  float A = amp.analyze();                            // Amp cal from 0 to 1 ;  
  float s = 200*A ;                                  // mult val for amp 
  if (A > 0.1 && glitch== true) {                                     // glitch only if A is gr8er than 0.5
    myGlitch.run();
  }
  rect(width/2, height/2, s, s);                        // rect
}

void mousePressed() {
  glitch = !glitch;
}