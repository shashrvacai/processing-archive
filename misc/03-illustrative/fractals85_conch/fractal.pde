class KF {
  PVector s, e;
  ArrayList<Line> l ;
  int c ;

  public KF() {
    s =  new PVector(0, height-20);
    e = new PVector(width, height-20);
    l = new ArrayList<Line>();
    restart();
  }

  void nL() {
    l = iterate(l);
  }

  void restart() {
    c = 0 ;
    l.clear();
    l.add(new Line(s, e));
  }

  int getCount() {
    return c ;
  }
  void render() {
    for (Line ll : l) {
      ll.show();
    }
  }
  
  ArrayList iterate(ArrayList<Line> before){
    ArrayList now = new ArrayList<Line>();
    
    for(Line ll: before){
      PVector a = ll.s();
      PVector b = ll.KL();
      PVector c = ll.KM();
      PVector d = ll.KR();
      PVector e = ll.e();
      now.add(new Line(a,b));
      now.add(new Line(b,c));
      now.add(new Line(c,d));
      now.add(new Line(d,e));
      
    }
    
    return now ;
  }
}