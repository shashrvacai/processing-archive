class PS {
  ArrayList<Par> ps ;
  PVector o ;
  PImage img ;

  PS(int num, PVector l_, PImage img_) {
    ps = new ArrayList<Par>();
    o = l_.get();
    img = img_ ;
    for (int i = 0; i < num; i++) {
      ps.add(new Par(o, img));
    }
  }

  void run() {
    for (int i = ps.size()-1; i >= 0; i--) {
      Par p = ps.get(i);
      p.run();
      if (p.isDead()) {
        ps.remove(i);
      }
    }
  }
  
  void aF(PVector dir){
    for (Par p: ps){
      p.af(dir);
    }
  }
  
  void aP(){
    ps.add(new Par(o , img));
  }
}