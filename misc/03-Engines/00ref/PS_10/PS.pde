class PS {
  ArrayList<Par> ps ;
  
  PS(PVector pos){
    ps = new ArrayList<Par>();
  }
  
  void run(){
    update();
    show();
  }
  
  void aP(PVector o_){
    ps.add(new Par(o_));
  }
  
  void show(){
    for (Par p : ps){
      p.show();
    }
  }
  
  void intersection(){
    for(Par p : ps){
      p.intersect(ps);
    }
  }
  
  void update(){
    for (int i = ps.size()-1; i >=0; i--){
      Par p = ps.get(i);
      p.update();
      if(p.isDead()){
        ps.remove(i);
      }
    }
  }

}