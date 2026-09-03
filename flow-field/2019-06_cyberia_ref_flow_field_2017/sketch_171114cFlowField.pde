import processing.sound.*;

Amplitude amp ;
AudioIn in ;


boolean debug = true;

FF ff ;
ArrayList<Vehicle> vs ;


void setup() {
  size(900, 900);
   background(255);
   
   
  amp = new Amplitude(this);
  in = new AudioIn (this,0);
  in.start();
  amp.input(in);
  
  ff = new FF(100);
  vs = new ArrayList<Vehicle>();
  for (int i = 0; i < 1440; i++) {
    vs.add(new Vehicle(new PVector(random(width), random(height)), random(5, 0), random(0.1, 0.5)));  // Position , MS mF
  }
}

void draw() {
  fill(255,50);
  noStroke();
  rect(0,0,width, height);
  noFill();
  
  float AA  = amp.analyze()*10;
 
  stroke(0);
  
  PVector sA = new PVector(random(-AA),random(AA));
    ff.init(AA);
 if (debug) ff.display();

  for (Vehicle v : vs) {
    //v.applyf(sA);
    v.follow(ff);
    v.run(map(mouseY, 0 ,height , -5,5));   // speed of the birds  
  }
  
}



void keyPressed() {
  if (key == ' ') {
    debug = !debug;
  }
  
  background(255);
}


void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
