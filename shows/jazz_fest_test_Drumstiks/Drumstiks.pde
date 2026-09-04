import processing.sound.*;

Amplitude amp ;
AudioIn in ;


Flock  f ;

void setup(){
   amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
  
  size(600,600);
  background(255);
  f = new Flock();
  for(int i =0 ; i < 400; i++){
    Bird b = new Bird(width/2,height/2);
    f.addBird(b);
  }
}

void draw(){
  rectMode(LEFT);
  fill(255,150);
  rect(0,0,width,height);
  noFill();
  float aa = amp.analyze();
  
  f.run(aa);
}

void mouseDragged(){
  f.addBird(new Bird(mouseX, mouseY));
}


// adjustable nDist , map audio to mF ;