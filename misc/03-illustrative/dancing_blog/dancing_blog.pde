PVector offset1, offset2;
float scale = 0.001;
color c1, c2;

void setup(){
  size(640, 640);
  noStroke();
  offset1 = new PVector(random(1000), random(1000));
  offset2 = new PVector(random(10000), random(10000));
  mousePressed();
}

void mousePressed(){
  c1 = color(random(255), random(255), random(255));
  c2 = color(random(255), random(255), random(255));
}

void draw(){
  background(60);
  translate(width / 2, height / 2);
  for(float radious = 250; radious > 0; radious -= 10){
    fill(map(radious, 0, 250, red(c1), red(c2)),
         map(radious, 0, 250, green(c1), green(c2)),
         map(radious, 0, 250, blue(c1), blue(c2)));
    beginShape();
    for(float angle = 0; angle < 360; angle += 0.5){
      float radian = radians(angle);  
      float x = radious * cos(radian);
      float y = radious * sin(radian);
      float nx = x + map(noise(x * scale + offset1.x, y * scale + offset1.y, frameCount * 0.015), 0, 1, -200, 200);
      float ny = y + map(noise(x * scale + offset2.x, y * scale + offset2.y, frameCount * 0.015), 0, 1, -200, 200);
      vertex(nx, ny);
    }
    endShape(CLOSE);
  }
}
