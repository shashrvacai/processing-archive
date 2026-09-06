class Walker {
  float x, y ;
  float tx, ty ;
  float  s = 25 ;  //  size , distance 


  Walker() {
    tx = 0;
    ty = 1000;
  }

  void render() {
    stroke(0);
    strokeWeight(0.1);
    //fill(0,5);
    ellipse(x, y, s*2, s*2);
    //point(x,y);
  }

  void step() {
    
    x = map(noise(tx), 0, 1, 0, width);
    y = map(noise(ty), 0, 1, 0, height);
    s = map(noise(tx), 0, 1, 0, 170);
    tx += 0.01;
    ty += 0.01;
  }
}