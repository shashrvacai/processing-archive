import processing.sound.*;
Amplitude amp;
AudioIn in;

float inc = 0.1;
int scl = 50;
float zoff = 0;

int cols;
int rows;

int noOfPoints = 200;

Particle[] particles = new Particle[noOfPoints];
PVector[] flowField;

void setup() {
  size(1000, 760, P2D);
  orientation(LANDSCAPE);
  background(0);
  hint(DISABLE_DEPTH_MASK);


  cols = floor(width/scl);
  rows = floor(height/scl); 
  flowField = new PVector[(cols*rows)];  // array with number of objects
  for (int i = 0; i < noOfPoints; i++) {
    particles[i] = new Particle();   // create new Particle
  }

  // Create an Input stream which is routed into the Amplitude analyzer
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

void draw() {
  fill(0, 100);
  rect(0, 0, width, height); 
  noFill();

  float A= amp.analyze();   // analysed amp from 0  to 1 ;
  float an = A*50;
  float nR = map(mouseX, 0, width, 0, TWO_PI*2);
  
  //PVector AA = new PVector(an , A);
  

  float yoff = 0;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      
      
      
      int index = (x + y * cols);
      float angle = noise(xoff, yoff, zoff) *TWO_PI+an;   // noise 
      PVector v = PVector.fromAngle(angle);
      v.setMag(0.1);

      flowField[index] = v;
      
      stroke(0, 255, 255, 50);
      strokeWeight(an);
        pushMatrix();
          translate(x*scl, y*scl);
          rotate(v.heading());
          line(0, 0, scl, 100);
          stroke(0, 255, 0, 50);
          line(0, 0, scl, 50);
        popMatrix();

      xoff =+ inc;
    }
    yoff = yoff + inc;
  }
  zoff = zoff + (inc / 50);



  for (int i = 0; i < particles.length; i++) {
    particles[i].follow(flowField);
    //particles[i].applyForce(AA);
    particles[i].update();
    particles[i].edges();
    //particles[i].show();
  }
}

void mousePressed() {
  
  background(0);
  fill(0);
  rect(0, 0, width, height);
}