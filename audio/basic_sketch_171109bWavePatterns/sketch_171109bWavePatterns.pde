Particle[] particles;
float alpha , au;

void setup() {
  size(200, 900);
  background(0);
  noStroke();
  setParticles();
  
}

void draw() {
  frameRate(20);
  alpha = map(mouseX, 0, width, 5, 35);
  fill(0);
  rect(0, 0, width, height);
  au = map(mouseX , 0, width,0,50) ;

  loadPixels();
  for (Particle p : particles) {
    p.move();
  }
  updatePixels();
}

void setParticles() {
  particles = new Particle[6000];
  for (int i = 0; i < 6000; i++) { 
    float x = random(width);
    float y = random(height);
    float adj = map(y, 0, height, 255, 0);
    int c = color(adj, 40, 255);
    particles[i]= new Particle(x, y, c);
  }
}

void mousePressed() {
  setParticles();
}

class Particle {
  float posX, posY, incr, theta;
  color  c;

  Particle(float xIn, float yIn, color cIn) {
    posX = xIn;
    posY = yIn;
    c = cIn;
  }

  public void move() {
    update();
    wrap();
    display();
  }

  void update() {
    incr +=  5;
    theta = noise(posX * au*0.0001, posY * au*0.0001, incr) * TWO_PI;
    posX += 2 * cos(theta);
    posY += 2 * sin(theta);
    au+=0.002 ;  
}

  void display() {
    strokeWeight(5);
    if (posX > 0 && posX < width && posY > 0  && posY < height) {
      pixels[(int)posX + (int)posY * width] =  c;
      
    }
  }

  void wrap() {
    if (posX < 0) posX = width;
    if (posX > width ) posX =  0;
    if (posY < 0 ) posY = height;
    if (posY > height) posY =  0;
  }
}