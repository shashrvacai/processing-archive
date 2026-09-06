ArrayList<KL> ls;

void setup(){
  size(600,600);
  background(0);
  ls = new ArrayList<KL>();
  PVector a = new PVector(0,173);
  PVector b = new PVector(width,0);
  PVector c = new PVector(width/2,153);  
  
  ls.add(new KL(a,b));
  ls.add(new KL(b,c));
  ls.add(new KL(c,a));
  
  for(int i = 0; i<5 ; i++){
    generate();
  }
}

void draw(){
  background(255);
  for(KL l: ls){
    l.show();
  }
  
}

void generate(){
  ArrayList n = new ArrayList<KL>();
  for(KL l : ls){
    PVector a = l.KA();
    PVector b = l.KB();
    PVector c = l.KC();
    PVector d = l.KD();
    PVector e = l.KE();
    
    n.add(new KL(a,b));
    n.add(new KL(b,c));
    n.add(new KL(c,d));
    n.add(new KL(d,e));
 
    
    
  }
  ls= n ;
}