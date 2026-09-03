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
    
    x = map(noise(tx), 0, 1, 0, (3*width)/2);
    y = map(noise(ty), 0, 1, 0, (3*height)/2);
    tx += aa/10;
    ty += aa/10;
    
    
  }
}
