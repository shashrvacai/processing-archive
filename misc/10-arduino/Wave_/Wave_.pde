import processing.serial.*;

Serial myPort;  // Create object from Serial class



int xspacing = 2;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
int gridX ;
int gridY ;
float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 1300.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup() {
  size(640, 640);
  
  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);

  gridX = width/4 ;
  gridY = height/5;
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw() {
  background(0);
  calcWave();
  renderWave();

  for (int i = 0; i< width; i+= gridX) {
    for (int j = 0; j< height; j+= gridY) {
      color fColor = get(i, j);      
      fill(fColor);     
            
      rect(i, j, gridX, gridY);
    }
  }
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*height/2;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(255);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/2+yvalues[x], 106, 106);
  }
}
