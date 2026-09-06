CA ca ;
int delay = 0 ;

void setup(){
  size(800,200);
  background(255);
  int[] ruleset ={
    0,1,0,1,1,0,1,0
  };
  ca = new CA(ruleset);
  frameRate(30);
}

void draw(){
  ca.show();
  ca.generate();
  if(ca.finished()){
    delay ++ ;
    if(delay > 30){
      background(255);
      ca.randomize();
      ca.restart();
      delay = 0 ;
    }
  }
}

void mousePressed(){
  background(255);
  ca.randomize();
  ca.restart();
}


class CA {
  int[] cells ;
  int generation ;
  int[] ruleset ;
  int w = 5 ;
  
  CA(int[] r_){
    ruleset = r_ ;
    cells = new int[width/w];
    restart();
  }
  
  void randomize(){
    for(int i = 0 ; i < 8 ; i++){
      ruleset[i] = int(random(2));
    }
  }
  
  void restart(){
    for(int i=0; i< cells.length;i++){
      cells[i] = 0 ;
    }
    cells[cells.length/2]=1 ;
    generation = 0 ;
  }
  
  void generate(){
    int[] nextgen = new int[cells.length];
    for(int i = 1 ; i < cells.length-1 ; i++){
      int l = cells[i-1];
      int m = cells[i];
      int r = cells[i+1];
      nextgen[i]= rules(l,m,r);
    }
    cells = nextgen;
    generation ++ ;
  }
  
  void show(){
    for(int i = 0; i < cells.length ; i++){
      if(cells[i]==1) fill(0);
      else            fill(255);
      noStroke();
      rect(i*w,generation*w,w,w);
    }
  }
  
  int rules(int a_, int b_, int c_){
    String s = "" + a_ +b_+c_;
    int index = Integer.parseInt(s,2);
    return ruleset[index];
  }
  
  boolean finished(){
    if(generation > height/w){
      return true;
    }
    else {
      return false ;
    }
  }
    
}