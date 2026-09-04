float inc = 3;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  translate(width/2, height/2);

  for (float i = 3.; i <= 48; i += 3.) {
    float speed = frameCount / i * 0.25f;
    pushMatrix();
    rotate(speed);
    for (float f = 0; f < i; f++) {
      float theta = f / i * TWO_PI;
      ellipse(cos(theta) * i * 5, sin(theta) * i * 5, 10, 10);
    }
    popMatrix();
  }
}