void Dkinect() {
  g = kinect2.getRegisteredImage() ;
  //println(g.width,g.height);
  PImage dep =  kinect2.getRegisteredImage();
  int[]  Rdep = kinect2.getRawDepth(); 

  noStroke(); 
  for (int x = 0; x < dep.width; x++) {
    for (int y = 0; y < dep.height; y++) {

      int  i = x + y* dep.width;    // index 
      int d = Rdep[i];   // depth index
      float X = map(x, 0, dep.width, 0, g.width);
      float Y = map(y, 0, dep.height, 0, g.height);
      color c = dep.get(int(X), int(Y)) ;
      stroke(c);
      strokeWeight(2);
      if (d >dMin && d <dMax) {
        pushMatrix(); 
        point(X, Y);
        popMatrix();
      }
    }
  }
}
