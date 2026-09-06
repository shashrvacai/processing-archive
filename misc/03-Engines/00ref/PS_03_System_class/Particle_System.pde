class PS{
  ArrayList<particle> ps ;
  PVector o ;
  
  PS(PVector pos_){
    o = pos_.get();
    ps = new ArrayList<particle>();
  }
  
  void addParticle(){
    ps.add(new particle(o));
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
