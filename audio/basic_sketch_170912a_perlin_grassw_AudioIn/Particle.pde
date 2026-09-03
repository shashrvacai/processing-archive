class Particle {
  PVector pos = new PVector(random(width),random(height));
  PVector vel = new PVector(0,0);
  PVector acc = new PVector(0,0);
  float maxSpeed = 1;

  PVector prevPos = pos.copy();

  public void update() {
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
  }

  public void follow(PVector[] vectors) {
    int x = floor(pos.x / scl);
    int y = floor(pos.y / scl);
    int index = (x-1) + ((y-1) * cols);
  
    index = index - 1;
    if(index > vectors.length || index < 0) {
    
      index = vectors.length - 1;
    }
    PVector force = vectors[index];
    applyForce(force);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  public void show() {
    stroke(255);
    strokeWeight(2);
    fill(0,50);
  
    point(pos.x, pos.y);
    //line(pos.x, pos.y,pos.x+20,pos.y-100);
  }

  public void updatePrev() {
    prevPos.x = pos.x;
    prevPos.y = pos.y;
  }

  public void edges() {
    if (pos.x > width) {
      pos.x = 0;
      //updatePrev();
    }
    if (pos.x < 0) {
      pos.x = width;
      //updatePrev();
    }

    if (pos.y > height) {
      pos.y = 0;
      //updatePrev();
    }
    if (pos.y < 0) {
      pos.y = height;
      //updatePrev();
    }
  }
}