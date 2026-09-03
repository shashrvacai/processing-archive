int steps = 104;
Orbiter[] Orb = new Orbiter[steps]; 
float r = 0;
float rad, off;
color top = color(7, 188, 255);        // color 1
color bottom =  color(255, 130, 206);      // color 2

void setup() {
  float x, y;
  size(1000, 1000);
  background(0);
  stroke(255);
  rad = width/10;

  for (int i = 0; i < steps; i++) {
    x = 400 + sin(r) * rad;
    y = 400 + cos(r) * rad;    
    off = noise(frameCount/1000) * r ;
    fill(255);
    noStroke();
    Orb[i]= new Orbiter(x, y, off, width/3);    
    r += PI/(steps/8);
  }
}

void draw() {   
  fill(0, 15);
  noStroke();
  rect(0, 0, width, height);
  fill(0);
  for (int i = 0; i < steps; i ++) {
    float C = map(i, 0, steps, 0, 1);
    color c = lerpColor(top, bottom, C);
    fill(c);
    Orb[i].display();
  }
}