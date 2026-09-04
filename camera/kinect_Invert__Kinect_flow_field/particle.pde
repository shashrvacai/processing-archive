
class Particle {
  PVector location;
  PVector velocity;

  float speed;
  float lifeSpan;
  float age;
 float ls =10 ;

  Particle (float x, float y, float z) {
    location = new PVector(x, y, z);
    velocity = new PVector(0, 0, 0);

    lifeSpan = ls;
    speed    =1;
    
  }

  void update() {
    // get current velocity
  {
      velocity = flowField.lookupVelocity(location);
      velocity.mult(speed);
      location.add(velocity);
      age++;
      lifeSpan-- ;
    }  

  }

  void render() {
    stroke(r, g, b);
    strokeWeight(map(lifeSpan,0,ls, 0.010,2));
    point(location.x, location.y, location.z/2);
  }
}
