class  veh {
  PVector pos, acc, vel ;
  float r, mF, mS ,ls;
  float A  ;

  veh(float x_, float y_ ) {
    ls = 255 ;
    pos = new PVector(x_, y_);
    vel = new PVector(random(-1,1), random(-1,1));
    acc = new PVector(0, 0);
    mS = 3 ;
    mF = 0.2 ;
    r = 6 ;
    A =0 ;
  }

  void aF(PVector f_) {
    acc.add(f_);
  }

  void aB(ArrayList<veh> veh_, float x_, float y_) {
    PVector sF = seperate(veh_);
    PVector seekF = seek(new PVector(x_, y_));
    sF.mult(3);
    seekF.mult(2);
    aF(sF);
    aF(seekF);
  }

  PVector seek(PVector t_) {
    PVector des = PVector.sub(t_, pos);
    des.normalize();
    des.mult(mS);
    PVector S = PVector.sub(des, vel);
    S.limit(mF);
    return S ;
  }

  PVector seperate(ArrayList<veh> vs) {
    float dS = r*3 ;
    PVector sum = new PVector();
    int count = 0;
    for (veh o : vs) {
      float d = PVector.dist(pos, o.pos);
      if ((d>0)&&(d <dS)) {
        PVector diff = PVector.sub(pos, o.pos);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count ++ ;
      }
    }

    if (count> 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(mS);
      sum.sub(vel);
      sum.limit(mF);
    }
    return sum ;
  }  

  void update() {
    vel.add(acc);
    vel.limit(mS);
    pos.add(vel);
    acc.mult(0);  
    A ++ ;
    ls-- ;
  }


  void show1(float a3_ , float a4_ , float a5_, float zu_) {
    tint(a3_,a4_,a5_,ls);
    rectMode(CENTER);
    float t = vel.heading2D();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(t);
    image(img,0,0,zu_,zu_);
    popMatrix();
  }
    void show2(float a3_ , float a4_ , float a5_, float zu_) {
    fill(a3_,a4_,a5_,ls);
    rectMode(CENTER);
    float t = vel.heading2D();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(t);
    rect(0, 0, r, r+zu_);
    popMatrix();
  }
  

  void edges() {
    if (pos.x > width+r) pos.x = 0 ;
    if (pos.y > height+r) pos.y = 0 ;
    if (pos.x < 0) pos.x = width+r ;
    if (pos.y < 0) pos.y = height+r ;
  }
boolean isDead() {
    if (ls < 0.0) {
      return true;
    } else {
      return false;
    }
  }
  
}