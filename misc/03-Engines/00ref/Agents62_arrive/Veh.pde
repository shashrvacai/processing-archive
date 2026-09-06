class Veh {
  float mS, mF, r ;
  PVector pos, acc, vel ;
  ArrayList<PVector> his = new ArrayList<PVector>();


  Veh(float x_, float y_) {
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    pos = new PVector(x_, y_);
    r = 10 ;
    mS = 4;
    mF = 0.1 ;
  }

  void aF(PVector f_) {
    acc.add(f_);
  }

  void arrive(PVector t_) {
    PVector des = PVector.sub(t_,pos);
    float d = des.mag();
    if(d <200){
    float m = map(d, 0,200, 0,mS);
    } else{
      des.mult(mS);
    }      
    PVector S= PVector.sub(des,vel);
    S.limit(mF);
    
    aF(S);
  }
  
  void update() {
    vel.add(acc);
    vel.limit(mS);
    pos.add(vel);
    acc.mult(0);

    his.add(pos.get());
    if (his.size()>100) {
      his.remove(0);
    }
  }

  void show() {
    
    beginShape();
    fill(0);
    noStroke();
    for (PVector v : his) {
      vertex(v.x, v.y);
      endShape();

      float theta = vel.heading2D() + PI/2;
      fill(127);
      stroke(0);
      strokeWeight(1);
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(theta);
      beginShape();
      vertex(0, -r*2);
      vertex(-r, r*2);
      vertex(r, r*2);
      endShape(CLOSE);
      popMatrix();
    }
  }
}

 