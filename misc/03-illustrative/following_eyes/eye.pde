class Eye {
  int x, y;
  int size;
  float angle = 0.0 , rand ;
  float ls = 255;
  
  
  Eye(int tx, int ty, int ts) {
    x = tx;
    y = ty;
    size = ts;
    rand = random(0.0,1.0);
 }

  void update(int mx, int my) {
    angle = atan2(my-y, mx-x);
  }
  
  void display() {
    stroke(0);
    strokeWeight(size/20);
    pushMatrix();
    translate(x, y);
    pushMatrix();
     rotate(-angle);
    fill(255);
    ellipse(0, 0, size, size-size/4);
    popMatrix();
    rotate(angle);
    fill(0);
    ellipse(size/4, 0, (size/6), (size/6));
    popMatrix();
  }
}
