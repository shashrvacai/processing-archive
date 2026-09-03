
import oscP5.*;
OscP5 oscP5;

float Fl1 =  4, Fl2 =  4, Fl3 =2;
color BGcol , FGcol ;

Flock flock;

float aa = 0.5 ;

void setup() {
  //ullScreen(1);
  size(1280,720);
  //surface.setResizable(true);
  background(255);
  
    //  ------------------------------OSC Connection --------------------
  oscP5 = new OscP5(this, 9600);
  // =------------------------------


  
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
   aa =map(Fl1,0,128,0.1,1);
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
