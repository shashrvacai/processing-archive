
class Particle {
  PVector location;
  PVector velocity;

  float speed;
  float lifeSpan;
  float age;


  Particle (float x, float y, float z) {
    location = new PVector(x, y, z);
    velocity = new PVector(0, 0, 0);

    lifeSpan = 75;
    speed    =3;
    
  }

  void update() {
    // get current velocity
    if (!onBeat) {
      velocity = flowField.lookupVelocity(location);
      velocity.mult(speed);
      location.add(velocity);
      age++;
      lifeSpan-- ;
    }  

  }

  void render() {
    stroke(r, g, b);
    strokeWeight(map(lifeSpan,0,76, 0.010,0.5));
    point(location.x, location.y, location.z/2);
  }
}
