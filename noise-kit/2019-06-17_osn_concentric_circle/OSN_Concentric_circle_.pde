// https://necessarydisorder.wordpress.com/2019/02/20/distortion-or-smoke-effect-on-parametric-curves/
// https://gist.github.com/Bleuje/3c9827d8cfaf291185f1190480ad797d

float turns = 2;
int n = 700;  // deFault = 70000
int K = 8;
float rad = 4.5;
float r =0 ;


OpenSimplexNoise noise;


void setup() {
  size(1200, 1200, P2D);
  result = new int[width*height][3];

  noise = new OpenSimplexNoise();
}

void draw() {
  t = mouseX*1.0/width;
  c = mouseY*1.0/height;
  if (mousePressed)
    println(c);
  draw_();
}


///////////////////////////




void draw_() {
  pushMatrix();
  fill(0,5);
  rect(0,0,width, height);
  popMatrix();
  push();
  translate(width/2, height/2);
  rotate(r);

  stroke(255, 100);
  strokeWeight(1.5);
  noFill();
   turns = 12; //  map(mouseX , 0 ,width,1 , 20);               /// number of turns  
  for (int k=0; k<K; k++) {
    for (int i=1; i<n; i++) {
      float p = (1.0*(i+0*t)/n)%1;

      float pp = pow(p, 1);

      float c1 = 0.1+ease(constrain(map(p, map(mouseX , 0 ,width,0 , 1), 1, 1, 0), 0, 1), 2.0);
      float c2 = ease(constrain(map(p, 0, map(mouseX , 0 ,width,1 , 0), 0, 1), 0, 1), 2.0);

      float theta = turns*TWO_PI*pow(0.1+map(mouseX , 0 ,width,1, 0)*pp, 0.5);
      float r = 0.4*width*pow(p, 0.5);       
      float x = r*cos(theta);
      float y = r*sin(theta)+(0.25*width-0.25*width*pow(0.05+0.95*p, 0.4+0.03*cos(TWO_PI*t)));

      float l = 500*c1*c2*constrain(map(y, -height/2, height/2-100, 2.0, 0), 0.12, 1);

      float part = 20.0;

      float dx = l*(float)noise.eval(10+0.79*k+rad*cos(TWO_PI*(part*p-t)), rad*sin(TWO_PI*(part*p-t)), 30*p);
      float dy = l*(float)noise.eval(92+0.79*k+rad*cos(TWO_PI*(part*p-t)), rad*sin(TWO_PI*(part*p-t)), 30*p);

      stroke(255*c1);
      point(x+dx, y+dy);
    }
  }
  
  pop();
  r +=0.001 ;
}

////////////////////

int[][] result;
float t, c;

float ease(float p) {
  return 2*p*p - 2*p*p*p;
}

float ease(float p, float g) {
  if (p < 0.5) 
    return 0.5 * pow(2*p, g);
  else
    return 1 - 0.5 * pow(2*(1 - p), g);
}

float mn = .5*sqrt(3), ia = atan(sqrt(.5));

void push() {
  pushMatrix();
  pushStyle();
}

void pop() {
  popStyle();
  popMatrix();
}
