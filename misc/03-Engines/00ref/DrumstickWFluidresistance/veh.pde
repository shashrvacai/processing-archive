class  veh {
  PVector pos, acc, vel ;
  float r, mF, mS ;

  veh(float x_, float y_) {
    pos = new PVector(x_, y_);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mS = 3 ;
    mF = 0.2 ;
    r = 6 ;
  }
  
    void aF(PVector f_){
    acc.add(f_);
  }
  
  void aB(ArrayList<veh> veh_, PVector pos_){
    PVector sF = seperate(veh_);
    PVector seekF = seek(new PVector(pos_.x,pos_.y ));
    sF.mult(2.5);
    seekF.mult(0.5);
    aF(sF);
    aF(seekF);
  
  }
  
  PVector seek(PVector t_){
    PVector des = PVector.sub(t_,pos);
    des.normalize();
    des.mult(mS);
    PVector S = PVector.sub(des,vel);
    S.limit(mF);
    return S ;  
  }
  
  PVector seperate(ArrayList<veh> vs){
    float dS = r*3 ;
    PVector sum = new PVector();
    int count = 0;
    for(veh o: vs){
      float d = PVector.dist(pos,o.pos);
      if((d>0)&&(d <dS)){
        PVector diff = PVector.sub(pos,o.pos);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count ++ ;
      }
    }
    
    if(count> 0){
      sum.div(count);
      sum.normalize();
      sum.mult(mS);
      sum.sub(vel);
      sum.limit(mF);
    }
    return sum ;
  }  
  
  void update(){
    vel.add(acc);
    vel.limit(mS);
    pos.add(vel);
    acc.mult(0);    
  }


  void show() {
    rectMode(CENTER);
    stroke(0);
    float t = vel.heading2D();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(t);
    rect(0, 0, r/2, r*10);
    popMatrix();
  }
}
