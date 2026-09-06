class Fractal{
  float b;
  float g;
  float r;
  float fac;

  Fractal(float ib, float ig, float ir, float ifac){
    b = ib;
    g = ig;
    r = ir;
    fac = ifac;
  }

  void draw(){
    //line(0, 0, 0, 60);
    branch(b, g, r, fac);
  }

  void branch(float b, float g, float r, float fac){
    b*=0.8;
    r*=fac;
    if (b > g){
      pushMatrix();
      rotateX(r);
      line(0, 0, 0, -b);
      translate(0, -b);
      branch(b, g, r, fac);
      popMatrix();

      pushMatrix();
      rotateX(-r);
      line(0, 0, 0, -b);
      translate(0, -b);
      branch(b, g, r, fac);
      popMatrix();

      pushMatrix();
      rotateZ(r);
      line(0, 0, 0, -b);
      translate(0, -b);
      branch(b, g, r, fac);
      popMatrix();

      pushMatrix();
      rotateZ(-r);
      line(0, 0, 0, -b);
      translate(0, -b);
      branch(b, g, r, fac);
      popMatrix();
    }
  }
}