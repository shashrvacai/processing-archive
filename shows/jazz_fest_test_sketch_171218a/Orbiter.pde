class Orbiter {
  float diam, offset, x, y, xpos, ypos;
  float theta = 0.0;

  Orbiter(float tmpX, float tmpY, float tmpOff, float tmpDiam) {
    offset = tmpOff;
    diam = tmpDiam;
    xpos = tmpX;
    ypos = tmpY;
  }

  void display() {
    x = xpos + sin(theta+offset)* diam/2;
    y = ypos + cos(theta+offset)* diam/2;
    ellipse(x, y, 7, 7);
    theta += 0.03;
  }
}