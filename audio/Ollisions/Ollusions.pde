class ollie {
  int maxC  ;
  float aDist, minEllipse, maxEllipse, fric ;
  PVector[] r ;

  ollie(int maxC_, float aDist_, float minEllipse_, float maxEllipse_, float fric_) {
    maxC = maxC_ ;
    aDist = aDist_ ;
    minEllipse = minEllipse_ ; 
    maxEllipse = maxEllipse_ ;
    fric =  fric_ ;

    r = new PVector[maxC];
    for (int i = 1; i < maxC; i++) {
      r[i] = new PVector(i*minEllipse, i*maxEllipse);
    }
  }

  void show(float x_ , float y_ ,float mapS_) {
    stroke(255);  
    float mx = map (mouseX, 0, width, 0, mapS_);
    float my = map (mouseY, 0, height, 0, 200);
    r[0] = new PVector(mapS_,height/2-mapS_);

    for (int i = 1; i < maxC; i ++) {
      float dX = r[i-1].x - r[i].x + aDist ;
      float dY = r[i-1].y - r[i].y + aDist ;

      r[i].x += dX*fric  ;
      r[i].y += dY*fric*mapS_/1000 ;
      blendMode(ADD);
      strokeWeight(4);
      ellipse(x_, y_, r[i].x-50, r[i].y -50 );
    }
  }
}