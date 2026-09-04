class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  PImage  tex ;

  Particle(float x, float y , PImage  tex_) {
    acceleration = new PVector(0, 0);
    float vx = randomGaussian()*0.3;
    float vy = randomGaussian()*0.3-1.0;
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    lifespan = 100.0;
    tex = tex_ ;
  }

  void run() {
    update();
    display();
  }
  
    void af(PVector f_){
    acceleration.add(f_);
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    //stroke(255, lifespan);
    noStroke();
    fill(15,150,255, lifespan);
    pushMatrix();  
    translate(location.x,location.y);
    imageMode(CENTER);
    //image(tex , 0,0);
    ellipse(0,0,8,8);
    popMatrix();
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
