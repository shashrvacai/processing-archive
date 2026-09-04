
class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  PImage  tex ;

  ParticleSystem(PVector location ) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }
  
    void aF(PVector dir){
    for (Particle p: particles){
      p.af(dir);
    }
  }
  
  void addParticle(float x, float y, PImage  tex_ ) {
    particles.add(new Particle(x,y,tex_ ));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
