class veh {
  float r, mS, mF ;
  PVector pos, acc, vel ;

  veh(float x_, float y_) {
    acc= new PVector(0, 0);
    vel = new PVector(random(-3,3),random(-2,2));
    vel.mult(5);
    pos = new PVector(x_, y_);
    r = 10 ;
    mS = 4 ;
    mF = 0.15 ;
  }

  void run() {
    show();
    update();
  }

  void bound() {
    PVector des = null;
    if (pos.x < d) {
      des = new PVector(mS, vel.y);
    } else if (pos.x > width-d) {
      des = new PVector(-mS, vel.y);
    }

    if (pos.y < d) {
      des = new PVector(vel.x, mS );
    } else if (pos.y > height-d) {
      des = new PVector( vel.x, -mS);
    }

    if (des !=null) {
      des.normalize();
      des.mult(mS);
      PVector S = PVector.sub(des, vel);
      S.limit(mF);
      aF(S);
    }
  }

  void aF (PVector f_) {
    acc.add(f_);
  }



  void update() {
    vel.add(acc);
    vel.limit(mS);
    pos.add(vel);
    acc.mult(0);
  }

  void show() {
    fill(0);
    stroke(255);
    strokeWeight(0.2);
    rectMode(CENTER);
    rect(pos.x, pos.y, r, 2*r);
  }
}