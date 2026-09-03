
int maxParticles = 2000; // the maximum number of active particles
ArrayList <Particle> particles = new ArrayList <Particle> (); // the list of particles
int drawMode = 0; // cycle through the drawing modes by clicking the mouse
color BACKGROUND_COLOR = color(0);
color PGRAPHICS_COLOR = color(0);
float fc001;
PGraphics pg;
PFont nexa ;

void setup() {
  size(1780, 980, P2D);
  surface.setResizable(true);
  smooth(2); 
  nexa = createFont("NexaBold",250);
  pg = createGraphics(width, height, JAVA2D);
  pg.beginDraw();
  pg.textSize(250);
  pg.textAlign(CENTER, CENTER);
  pg.fill(PGRAPHICS_COLOR);
  pg.text("Cai", pg.width/2,pg.height/2); 
  pg.endDraw();
  background(BACKGROUND_COLOR);
}

void draw() {
  fill(0,10);
  rect(0,0,width,height);
  noFill();
  
  fc001 = frameCount * 0.01;
  addRemoveParticles();
  // update and display each particle in the list
  for (Particle p : particles) {
    p.update();
    p.display();
  }
}

void mousePressed() {
  drawMode = ++drawMode%4; // cycle through 4 drawing modes (0, 1, 2, 3)
  background(BACKGROUND_COLOR); // clear the screen
  if (drawMode == 2) image(pg, 0, 0); // draw text to the screen for drawMode 2
  particles.clear(); // remove all particles
}

void addRemoveParticles() {
  // remove particles with no life left
  for (int i=particles.size()-1; i>=0; i--) {
    Particle p = particles.get(i);
    if (p.life <= 0) {
      particles.remove(i);
    }
  }
  // add particles until the maximum
  while (particles.size () < maxParticles) {
    particles.add(new Particle());
  }
}
