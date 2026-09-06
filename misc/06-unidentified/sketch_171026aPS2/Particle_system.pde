class ParticleSystem{
  ArrayList<Particle> ps ;
  
  PVector o ;
  
  ParticleSystem(PVector pos){
    o = pos.get();
    ps = new ArrayList<Particle>();
  }
  
  void addParticle(){
    ps.add(new Particle(o));
  }
  
  void run(){
    for (int i = ps.size()-1 ; i >0 ;i--){
       Particle p = ps.get(i);
       p.run();
       
       if(p.isDead()){
           ps.remove(i);
         }
    }
  }



}