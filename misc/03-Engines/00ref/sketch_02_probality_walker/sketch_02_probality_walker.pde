Walker w ;

  void setup(){
    size(800,500);
    w = new Walker();
    
    background(255);
  }
  
  void draw(){
    noStroke();
    w.step();
     w.render();
  }
  