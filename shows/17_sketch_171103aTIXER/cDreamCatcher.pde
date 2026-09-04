class DreamCatcher {
  float A = 0 ;
  Dc dc;
  PImage ink ;
  int si = 100;

  


  DreamCatcher() {
    dc = new Dc();
  }

  void run() {
    {
      float AMP = amp.analyze();


      fill(0, 15);    
      rect(0, 0, width*2, height*2);
      noFill();

      
      strokeWeight(1);

      int b = 1 ;
      for (int i =0; i < width+500; i +=si) {
        for (int j =0; j < height+500; j +=si) {
          dc.DCdraw(i, j, si, b, A);
          b +=5 ;
        }
      }
      A += AMP *0.9;
    }
  }
}