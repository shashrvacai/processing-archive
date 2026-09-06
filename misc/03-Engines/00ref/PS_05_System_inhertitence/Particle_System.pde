class PS{
  ArrayList<particle> ps ;
  PVector o ;
  
  PS( PVector pos_ ){
    o = pos_.get();
    ps = new ArrayList<particle>();
    
  }
  
  boolean dead(){
    if(ps.isEmpty()){
      return true ;
    } else {
      return false ;
    }
  }

  
  void addParticle(){
    float r = random(1);
    if(r < 0.5){
    ps.add(new particle(o));
    } else {
      ps.add(new confetti(o));
    }
  }
  
  void run(){
    for (int i = ps.size()-1; i>= 0 ; i --){
      particle p = ps.get(i);
      p.run();
      if (p.isDead()){
        ps.remove(i);
      }
    }
  }
}