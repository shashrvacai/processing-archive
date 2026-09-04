int numPoints = 3000;
float incr = TWO_PI/numPoints;
float r1, r2, r3, n1, n2, n3, phi1, phi2, phi3, incr2;
boolean show;

void setup() {
  size(450, 450); 
  colorMode(HSB, 360, 100, 100, 100);
  r1 = 28;
  r2 = -104.0; 
  r3 = -75;
  n1 = -206.3;
  n2 = -42;
  n3 = 40;
  phi1 = phi2 = phi3 = 0; // 2 and 3 not used
  show = false;
}

void draw() {
  background(#030121);
  phi1 += .0003;
  incr2 = ((sin(frameCount * .01)*30));
  
  float  xs = width/2 + r1 * cos (n1 * (0 + phi1)) + r2 * cos(n2*(0 + phi2)) + r3 * cos(n3*(0+phi3));
  float  ys = height/2 + r1 * sin (n1 * (0 + phi1)) + r2 * sin(n2*(0 + phi2)) + r3 * sin(n3*(0+phi3));

  for (float i = incr; i <= TWO_PI; i += incr) {
    float  xf = width/2 + r1 * cos (n1 * (i + phi1)) + r2 * cos(n2*(i + phi2)) + r3 * cos(n3*(i+phi3));
    float  yf = height/2 + r1 * sin (n1 * (i + phi1)) + r2 * sin(n2*(i + phi2)) + r3 * sin(n3*(i+phi3));
    float h = map(i, incr, TWO_PI, 230, 180);
    stroke(h - incr2, 100, 100);
    strokeWeight(.5);
    line(xs, ys, xf, yf);
    noStroke();
    fill(360);
    if (show) ellipse(xs, ys, 1.5, 1.5);
    xs = xf;
    ys = yf;
  }
}


void mousePressed(){
  show = !show;
}