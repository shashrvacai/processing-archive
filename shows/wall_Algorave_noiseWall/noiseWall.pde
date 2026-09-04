void setup() {
  size(450, 450);
}

void draw() {
 float aa = 0.5;//amp.analyze();
  rectMode(CENTER);
  stroke(0);
  for (int x = 10; x < width; x += 10) {
    for (int y = 10; y < height; y += 10) {
      float n = noise(x * 0.005, y * 0.005, frameCount * 0.05);
      pushMatrix();   
      float recSize = n*aa*10;     
      translate(x, y);
      rotate(TWO_PI *aa*n);
      scale( recSize);
      rect(0, 0, 5, 5);
      popMatrix();
    }
  }
}
