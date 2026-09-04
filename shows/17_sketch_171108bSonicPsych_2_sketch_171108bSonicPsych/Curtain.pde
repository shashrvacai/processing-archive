class Curtain {
  float z = 0;
  Curtain() {
  }

  void run() {
    float aa = amp.analyze()*100;
    noStroke();

    
    for (float y = 0; y < height; y = y + 1) {
      for (float x = width; x > 0; x = x -20) {
        float max = aa*map(y, height, 0,2, 10)+2 ;
        strokeWeight(max); 
        float R= map(max , 0 ,15 , 0,255);
        float G= map(y , 0 ,height, 0,255);
        stroke(255-R,G,R);
        point(x+map(noise(x*aa/500, y/200, z), 0, 1, -100, 100), y ); 
      }
    }
    z = z + 0.002;
  }
}