
class Flock {
  ArrayList boids;

    Flock() {
    boids = new ArrayList(); 
  }

  void run() {
    for (int i = boids.size()-1 ; i >= 0 ; i--) {
      Boid b = (Boid) boids.get(i);  
      b.run(boids);  
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }
}
