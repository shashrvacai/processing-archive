class Bird {
  PVector pos, acc, vel;
  float mS, mF, ls, r ;

  Bird(float x_, float y_) {
    pos = new PVector(x_, y_);
    vel = new PVector(random(-1,1),random(-1,1));
    acc = new PVector(0, 0);
    r = 3 ;
    mS = 3 ; 
    mF = 0.05 ;
  }
  
  void run(ArrayList<Bird> B_){  
    flock(B_);
    update();
    show();
    edges();
  }
  
  void flock(ArrayList<Bird> B_){        ///  -----------aply all forces 
    PVector sep = seperate(B_);
    PVector ali = align(B_);
    PVector coh = cohesion(B_);
    sep.mult(1.5);
    ali.mult(1);
    coh.mult(1);
    aF(sep);
    aF(ali);
    aF(coh);
  }


  
  PVector seperate(ArrayList<Bird> B_){   // -------------seperate (return PVector)
    float des = 25f ; 
    PVector S = new PVector(0,0);
    int c = 0 ;
    for (Bird b: B_){
      float d = PVector.dist(pos,b.pos);
      if((d>0)&&(d < des)){
        PVector diff = PVector.sub(pos,b.pos);
        diff.normalize();
        diff.div(d);
        S.add(diff);
        c++;
      }
    }
    
    if(c >0){
      S.div((float)c);
    }
    
    if(S.mag()>0){
      S.normalize();
      S.mult(mS);
      S.sub(vel);
      S.limit(mF);
    }
    return S ;
  }

  PVector align(ArrayList<Bird> B_) {   //// returns PVector ALIGN
    float nDist = 50 ;
    PVector sum = new PVector(0, 0);
    int c =0 ;
    for (Bird b : B_) {
      float d = PVector.dist(pos, b.pos);
      if ((d>0)&&(d<nDist)) {
        sum.add(b.vel);
        c++ ;
      }
    }
    if (c > 0) {
      sum.div((float)c);
      sum.normalize();
      sum.mult(mS);
      PVector S = PVector.sub(sum, vel);
      S.limit(mF);
      return S ;
    } else {
      return new PVector(0,0);
    }
  }  


  PVector cohesion(ArrayList<Bird> B_) {    /// ------------ cohesion(returns vector)
    float nDist = 50;
    PVector sum = new PVector(0, 0);
    int c = 0 ;
    for (Bird b : B_) {
      float d= PVector.dist(pos, b.pos);
      if ((d>0)&&(d < nDist)) {
        sum.add(b.pos);
        c ++ ;
      }
    }
    if (c > 0) {
      sum.div(c);
      return seek(sum);
    } else {
      return new PVector(0, 0);
    }
  }
  
    PVector seek(PVector t_) {  // ---------------- Seek(return PVector)
    PVector des = PVector.sub(t_, pos);
    des.normalize();
    des.mult(mS);
    PVector S = PVector.sub(des, vel);
    S.limit(mF);
    return S ;
  }
  

  void aF(PVector f_) {   //--------------------apply FORCE
    acc.add(f_);
  }

  void update() {   /// --------------------Physics Engine
    vel.add(acc);
    vel.limit(mS);
    pos.add(vel);
    acc.mult(0);
  }

  void edges() {  // ------------------- wraparound
    if (pos.x > width+r) pos.x = 0 ;
    if (pos.y > height+r) pos.y = 0 ;
    if (pos.x < 0) pos.x = width+r ;
    if (pos.y < 0) pos.y = height+r ;
  }

  boolean isDead() {    //  ------------------- DEATH 
    if (ls < 0.0) {
      return true;
    } else {
      return false;
    }
  }

  void show() {     //        --------------------SHOW
    float theta = vel.heading2D();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    rectMode(CENTER);
    rect(0, 0, r/2, r*5);
    popMatrix();
  }
}