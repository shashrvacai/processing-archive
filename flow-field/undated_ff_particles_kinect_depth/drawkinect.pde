void Dkinect() {
  pushMatrix();
  Kanvas.fill(0, 100);
  Kanvas.rect(0, 0, width, height);
  Kanvas.noFill();
  popMatrix();

  g = K.getRegisteredImage() ;
  PImage dep =  K.getDepthImage();
  // println(g.width, g.height, dep.width, dep.height);

  int[]  Rdep = K.getRawDepth();
  noStroke();
  
  for (int x = 0; x < dep.width; x++) {
    for (int y = 0; y < dep.height; y++) {
      
      int  i = x + y* dep.width;    // index 
      int d = Rdep[i];   // depth index
      float X = map(x, 0, dep.width, 0, g.width);
      float Y = map(y, 0, dep.height, 0, g.height);

      color c = g.get(int(X), int(Y)) ;
      fill(255);
      if (d >dMin && d <dMax) {
        pushMatrix(); 
        ellipse(X, Y, 4, 4);
        popMatrix();
      }
    }
  }
}
