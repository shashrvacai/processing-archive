class LANE {
  float r = 50;
  float A , H;

  LANE(float a) {
    A = a ;
   
  }
  
  void update() { 

    float x = sin(A)* r ;
    float y =  cos(A)* r ;


    ellipse(x, y, 10, 10);

    A+= 0.1;
  }

}