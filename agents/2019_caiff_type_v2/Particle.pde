
class Particle {
  PVector loc;
  float life, lifeRate;

  Particle() {
    getPosition();
    life = 10;
    lifeRate = random(0.001, 0.2);
  }

  void update() {
    float angle = noise(loc.x * 0.01, loc.y * 0.01) * TWO_PI;
    PVector vel = PVector.fromAngle(angle + globalRotation);
    loc.add(vel);
    
    life -= lifeRate;
  }

  void display() {
    //boolean special = random(1) < 0.001;
    strokeWeight(  2.75);
    stroke(255,   5);
    point(loc.x, loc.y);
  }

  // get a random position inside the text
  void getPosition() {
    while (loc == null || !isInText (loc)) loc = new PVector(random(width), random(height));
  }

  // return if point is inside the text
  boolean isInText(PVector v) {
    return pg.get(int(v.x), int(v.y)) == PGRAPHICS_COLOR;
  }
}
