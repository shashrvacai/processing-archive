class Particle {
  PVector pos, acc, vel ;
  float ls ;
  float m = 1 ;

  Particle(PVector l_) {
    acc = new PVector(0, 0);
    pos = l_.get();
    vel = new PVector(random(-1, 1), random(1, -1));
    ls = 255 ;
  }
  
  void run(){
    update();
    show();
  }
  
  void aF(PVector f_){
    PVector f = f_.get();
    f.div(m);
    acc.add(f);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    ls -= 2;
  }

  void show() {
    fill(0, ls );
    noStroke();
    ellipse(pos.x, pos.y, 12, 12);
  }


  boolean isDead() {
    if (ls < 0) {
      return true;
    } else {
      return false ;
    }
  }
}