class sPI {
  float a ;

  sPI() {
    a = 0 ;
  }

  void run(float a_) {
    pushMatrix();
    translate(width/2, height/2);
    for (float i = 3.; i <= 148; i += 3) {
      float speed = (frameCount / (i)*0.0001) +a;
      pushMatrix();
      rotate(speed*(i/100));
      for (float f = 0; f < i; f++) {
        float theta = f / i * TWO_PI;
        fill(255);
        ellipse(cos(theta) * i * 3, sin(theta) * i * 3, 5, 5);
      }
      popMatrix();
    }
    popMatrix();
    a += a_ ;
  }
}