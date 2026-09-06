class ParticleSystem
{
  Particle[] particles;

  ParticleSystem() {
    particles = new Particle[NUM_PARTICLES];
    for (int i = 0; i < NUM_PARTICLES; i++){
      particles[i]= new Particle();
    }
  }

  void update(float p_) {
    for (int i = 0; i < NUM_PARTICLES; i++){
      particles[i].update(p_);
    }
  }

  void render(){
    for (int i = 0; i < NUM_PARTICLES; i++){
      particles[i].render();
    }
  }
}
