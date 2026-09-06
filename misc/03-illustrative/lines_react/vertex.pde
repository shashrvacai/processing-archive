class Vertex{
  
  PVector loc,vel,acc;
  float thres,thresT,decay;
  
  Vertex(float initX,float initY){
    
    loc = new PVector(initX,initY);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    
    decay = 0.9;
    thres = 0;
    thresT = 20;
  }
  
  void update(){
    thres = lerp(thres,thresT,0.1);
    vel.add(acc);
    vel.limit(10);
    vel.mult(decay);
    loc.add(vel);
    acc.set(0,0,0);
  }
  
  void repel(Vertex repV){
    PVector dir = new PVector(0, 0);
    float repForce = 0;
    dir = PVector.sub(loc, repV.loc);
    if (dir.mag() < thres) {
        repForce = 1/(dir.mag()+1);
        dir.normalize();
        dir.mult(repForce);
        acc.add(dir);
        repV.acc.sub(dir);
      }
  }
  
  void interferedBy(Interference itf, float force){
    PVector dir = new PVector(0, 0);
    float distance = 0;
    dir = PVector.sub(itf.loc, loc);
    distance = dir.mag();
    dir.normalize();
    dir.mult(distance*force);
    acc.add(dir);
  }
  
  void tensedBy(Vertex v1,Vertex v2, float force){
    PVector mid = new PVector((v1.loc.x+v2.loc.x)*0.5,(v1.loc.y+v2.loc.y)*0.5);
    PVector dir = new PVector(0, 0);
    float distance = 0;
    dir = PVector.sub(mid, loc);
    distance = dir.mag();
    dir.normalize();
    dir.mult(distance*force);
    acc.add(dir);
  }
  
  void display(){
    ellipse(loc.x,loc.y,5,5);
  }
}
class Worm {

  ArrayList vertices;

  Worm() {
    vertices = new ArrayList();
  }

  void update() {
    for (int i=0;i<vertices.size();i++) {
      Vertex eachV = (Vertex) vertices.get(i);
      eachV.update();
    }
  }

  void repelWithin() {
    for (int i=1;i<vertices.size()-1;i++) {
      Vertex eachV = (Vertex) vertices.get(i);
      for (int j=i+1;j<vertices.size()-1;j++) {
        Vertex repV = (Vertex) vertices.get(j);
        eachV.repel(repV);
      }
    }
  }

  void repelWithOther(Worm repWorm) {
    for (int i=1;i<vertices.size()-1;i++) {
      Vertex eachV = (Vertex) vertices.get(i);
      for (int j=1;j<repWorm.vertices.size()-1;j++) {
        Vertex repV = (Vertex) repWorm.vertices.get(j);
        eachV.repel(repV);
      }
    }
  }
  
  void tensedWithin(){
    for (int i=1;i<vertices.size()-1;i++) {
      Vertex eachV = (Vertex) vertices.get(i);
      Vertex pV1 = (Vertex) vertices.get(i-1);
      Vertex nV1 = (Vertex) vertices.get(i+1);
      eachV.tensedBy(pV1,nV1,0.01);
      if(i>1&&i<vertices.size()-2){
        Vertex pV2 = (Vertex) vertices.get(i-2);
        Vertex nV2 = (Vertex) vertices.get(i+2);
        eachV.tensedBy(pV1,nV2,0.005);
        eachV.tensedBy(pV2,nV1,0.005);
        eachV.tensedBy(pV2,nV2,0.005);
      }
    }
  }

  void interferedBy(Interference itf, float force) {
    for (int i=0;i<vertices.size();i++) {
      Vertex eachV = (Vertex) vertices.get(i);
      eachV.interferedBy(itf, force);
    }
  }

  void display() {
    noFill();
    stroke(0);
    strokeWeight(2);
    if (vertices.size()>3) {
      for (int i=1;i<vertices.size()-2;i++) {
        Vertex control1 = (Vertex) vertices.get(i-1);
        Vertex draw1 = (Vertex) vertices.get(i);
        Vertex draw2 = (Vertex) vertices.get(i+1);
        Vertex control2 = (Vertex) vertices.get(i+2);
        curve(control1.loc.x, control1.loc.y, draw1.loc.x, draw1.loc.y, draw2.loc.x, draw2.loc.y, control2.loc.x, control2.loc.y);
      }
    }
  }

  void spawnV(float initX, float initY) {
    if (vertices.size()==0) {
      Vertex addedV = new Vertex(initX, initY);
      vertices.add(addedV);
      newVertexSpawn = true;
    }
    else {
      Vertex lastV = (Vertex) vertices.get(vertices.size()-1);
      if (dist(initX, initY, lastV.loc.x, lastV.loc.y)>=5) {
        Vertex addedV = new Vertex(initX, initY);
        vertices.add(addedV);
        newVertexSpawn = true;
      }else{
        newVertexSpawn = false;
      }
    }
  }
}
