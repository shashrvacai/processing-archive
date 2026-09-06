class Particle {
  PVector pos, vel, acc ;
  float ls ;

  float m = 1 ;

  Particle(PVector l_) {
    pos = l_.get();
    acc = new PVector(0, 0);
    vel = new PVector(random(-1, 1), random(1, -1));
    ls = 255 ;
  }

  void run() {
    update();
    show();
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    ls -= 2 ;
  }
  
  void aF(PVector f_){
    PVector f = f_.get();
    f.div(m);
    acc.add(f);
  }

  void show() {
    fill(0, ls );
    ellipse(pos.x, pos.y, 10, 10);
  }

  boolean isDead() {
    if (ls < 0 ) {
      return true ;
    } else {
      return false ;
    }
  }
}