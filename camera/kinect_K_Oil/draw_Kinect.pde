void Dkinect() {
  //pushMatrix();
  //Kanvas.fill(255, 100);
  //Kanvas.rect(0, 0, width, height);
  //Kanvas.noFill();
  //popMatrix();

  PImage dep =  K.getRegisteredImage();

  int[]  Rdep = K.getRawDepth();
  noStroke();
  
  int skip = 55 ;
  for (int x = 0; x < dep.width; x+=5) {
    for (int y = 0; y < dep.height; y+=5) {
      
      int  i = x + y* dep.width;    // index 
      int d = Rdep[i];   // depth index

      fill(255);
      if (d >dMin && d <dMax) {
        pushMatrix(); 
        move(x,y);
        //ellipse(x, y, 4, 4);
        popMatrix();
      }
    }
  }
}
