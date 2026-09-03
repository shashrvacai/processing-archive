void setup() {
  size(1000, 1000);
  noFill();
}

void draw() {
  background(0);
  float mX = (float)180/width*mouseX;
  float mY = (float)360/height*mouseX;

  fill(255,50);
  noStroke();
  //stroke(255);
  strokeWeight(2);
  translate(width/2, height/2);
  for (int i = 0; i < 360; i+= 6) {
    float x = sin(radians(i))*mX;
    float y = cos(radians(i))*mY;

    float l = map(mouseX, 0, width, 0, 5);

    pushMatrix();

    translate(x, y);
    rotate(-radians(i-frameCount)*2);
    ellipse(0, 0, 250, 50);
    popMatrix();

    //pushMatrix();
    //translate(-x, -y);
    //rotate(radians(i-frameCount)*0.5);
    //ellipse(0, 0, 200, 100);
    //popMatrix();
  }
}