class PS {
  ArrayList<Particle> ps ;
  PVector o ;
  
  PS(PVector pos_){
    o = pos_.get();
    ps = new ArrayList<Particle>() ;
  }
  
  void aP(){
    ps.add(new Particle(o));
  }
  
  void applyF(PVector f_){
    for (Particle p : ps){
      p.aF(f_);
    }
  }
  
  void run(){
    for (int  i = ps.size()-1 ; i>=0 ;i--){
      Particle p =  ps.get(i);
      p.run();
      if(p.isDead()){
        ps.remove(i);
      }
    }
  }
  
  void aR(Repeller r_){
    for (Particle p : ps){
      PVector f =  r_.repel(p);
      p.aF(f);
    }
  }
}

 