class StageManager {

  ArrayList worms;
  ArrayList itfs;
  int maxPAmt;

  StageManager() {
    worms = new ArrayList();
    itfs = new ArrayList();
  }

  void update() {
    for (int i=0;i<worms.size();i++) {
      Worm eachW = (Worm) worms.get(i);

      eachW.repelWithin();
      eachW.tensedWithin();

      for (int j=i+1;j<worms.size();j++) {
        Worm repWorm = (Worm) worms.get(j);
        eachW.repelWithOther(repWorm);
      }

      for (int k=0;k<itfs.size();k++) {
        Interference eachItf = (Interference) itfs.get(k);
        eachW.interferedBy(eachItf, eachItf.force);
      }

      eachW.update();
    }
  }

  void display() {
    for (int i=0;i<worms.size();i++) {
      Worm eachW = (Worm) worms.get(i);
      eachW.display();
    }
  }
  
  void checkVanish(){
    for (int i = worms.size()-1;i>=0;i--){
      Worm eachW = (Worm) worms.get(i);
      if(eachW.vertices.size()<=3){
        worms.remove(i);
      }
    }
  }

  void checkIntersect() {

    Worm currentW = (Worm) worms.get(currentDrawingWormIndex);
    int lastVertexIndex = currentW.vertices.size()-2;

    if (lastVertexIndex>=0) {
      Vertex currentVertex = (Vertex)currentW.vertices.get(lastVertexIndex+1);
      Vertex lastVertex = (Vertex)currentW.vertices.get(lastVertexIndex);
      PVector cSeg1v1 = new PVector(currentVertex.loc.x, currentVertex.loc.y);
      PVector cSeg1v2 = new PVector(lastVertex.loc.x, lastVertex.loc.y);

      for (int i=0;i<worms.size();i++) {
        if (i==currentDrawingWormIndex) {
          continue;
        }
        else {
          Worm eachW = (Worm) worms.get(i);
          for (int j=1;j<eachW.vertices.size()-2;j++) {
            Vertex v1 = (Vertex)eachW.vertices.get(j);
            Vertex v2 = (Vertex)eachW.vertices.get(j+1);
            PVector cSeg2v1 = new PVector(v1.loc.x, v1.loc.y);
            PVector cSeg2v2 = new PVector(v2.loc.x, v2.loc.y);
            if (intersect(cSeg1v1, cSeg1v2, cSeg2v1, cSeg2v2)) {

              Worm cutOffSeg = new Worm();
              worms.add(cutOffSeg);

              for (int k=j;k<eachW.vertices.size();k++) {
                Vertex ogV = (Vertex)eachW.vertices.get(k);
                Vertex addedV;
                if (k==j) {
                  addedV = new Vertex((v1.loc.x+v2.loc.x)*0.5, (v1.loc.y+v2.loc.y)*0.5);
                }else {
                  addedV = new Vertex(ogV.loc.x, ogV.loc.y);
                }
                cutOffSeg.vertices.add(addedV);
              }

              v1.loc.x = (v1.loc.x+v2.loc.x)*0.5;
              v1.loc.y = (v1.loc.y+v2.loc.y)*0.5;
              for (int k=eachW.vertices.size()-1;k>j+1;k--) {
                eachW.vertices.remove(k);
              }
            }
          }
        }
      }
    }
  }

  boolean intersect(PVector s1v1, PVector s1v2, PVector s2v1, PVector s2v2) {
    float denominator = (s1v1.x-s1v2.x)*(s2v1.y-s2v2.y)-(s1v1.y-s1v2.y)*(s2v1.x-s2v2.x);
    if (denominator==0) {
      return false;
    }
    else {
      float istX = ((s1v1.x*s1v2.y-s1v2.x*s1v1.y)*(s2v1.x-s2v2.x)-(s1v1.x-s1v2.x)*(s2v1.x*s2v2.y-s2v2.x*s2v1.y))/denominator;
      float istY = ((s1v1.x*s1v2.y-s1v2.x*s1v1.y)*(s2v1.y-s2v2.y)-(s1v1.y-s1v2.y)*(s2v1.x*s2v2.y-s2v2.x*s2v1.y))/denominator;
      if ( (istX-s1v1.x)*(istX-s1v2.x)<=0 && (istY-s1v1.y)*(istY-s1v2.y)<=0 && (istX-s2v1.x)*(istX-s2v2.x)<=0 && (istY-s2v1.y)*(istY-s2v2.y)<=0 ) {
        return true;
      }
      else {
        return false;
      }
    }
  }

  void spawnW() {
    Worm addedW = new Worm();
    worms.add(addedW);
  }

  void spawnItf(float initX, float initY, float force) {
    Interference addedItf = new Interference(initX, initY, force);
    itfs.add(addedItf);
  }
}
