import processing.sound.*;


Amplitude  amp ;
AudioIn in ;
color BGcol , FGcol ;

Flock flock;

float aa = 0.5 ;

void setup() {
  fullScreen(1);
  //size(640,360);
  //surface.setResizable(true);
  background(255);
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
  BGcol = color(0);
  FGcol = color(255);
  
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 400; i++) {
    Boid b = new Boid(width/2,height/2);
    flock.addBoid(b);
  }
}


void draw() {
  if(keyPressed == true && key =='7'){
    aa=00;
  }else{
   aa = map(amp.analyze(),0,0.5,0,200);
  }
  fill(BGcol,15);
  noStroke();
  rect(0,0,width,height);
  //noFill();
  fill(FGcol);
  flock.run();
  
}

// Add a new boid into the System
void mouseDragged() {
  flock.addBoid(new Boid(mouseX,mouseY));
}