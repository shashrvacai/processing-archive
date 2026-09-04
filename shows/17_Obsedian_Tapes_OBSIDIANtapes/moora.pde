class moora {
  int mysize= 600;
  float spacing =18;
  float meanDiam = mysize/ 80;
  int flipFlop = 1;
  float angle=1;
  float radius= 1;
  float speed=1;
  float pixcol=100;
  float dx; 
  float dy;


  moora() {
    ellipseMode(CENTER);
    mouseX = width/2;
    mouseY = height/2;
  }

  void run(float aa_) {
    float bF = map(aa_, 0, 1, 0, 10);
    speed= TWO_PI/ map(aa_, 0, 1, 1, 20) ;
    spacing = map(aa_, 0, 1, 15, 1 );

    for (float y=spacing; y<height; y+=spacing) {
      for (float x= spacing; x<width; x+=spacing) { 
        dx = x - width/2; //-mouseX;
        dy = y - height/2; //-mouseY;
        radius = mag( dy *bF, dx *bF);
        angle = atan2(dy, dx)- frameCount* speed;
        pixcol= cos(radius+angle)*2;
        
        fill(255);
        float varried = meanDiam*  pixcol;
        ellipse(x, y, varried, varried);
      }
    }
  }
}