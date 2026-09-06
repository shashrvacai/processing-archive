
int gX, gY;  // size of pixellation 

void setup() {
  size(600, 600);
  background(230,10);
  strokeWeight(4);
  pixelDensity(2);//increase for better resolution images.


}

float zoff = 0,  angle = 0;

void draw() {

  gX = 100;//int(map(mouseX, 0, width, 50, 2));
  gY = 1;//int(map(mouseY, 0, height, 2, 50));
  
  float size = map(mouseX,0,width,2,height);
  float animationSpeed = 0.000002;
  float mainColor = 15;
  float radius = map(mouseX,0,width,2,10);

  background(255);
  stroke(mainColor);
  noFill();

  for (int i = 0; i <= width ; i += 5) {
    beginShape();
    for (int j = 0; j <= height ; j += 30) {
      float x =i;
      float  y =j;
      float scale = 0.0005;//using a scale vaiable because steps between i and j counters are too large steps for noise function.      
      //check if points are inside the slider size value.
      if (dist(i, j, width/2, height) < size) {
        float n = map(noise(i * scale, j * scale, zoff), 0, 1, -1, 1);
        x = i +  n*radius * sin(angle + n * 0.1);
        y = j +  n*radius * cos(angle + n * 300);
     }

      curveVertex(x, y);
      // point(x,y);
    }
    endShape();
  }

    zoff += 0.001;
    angle += animationSpeed;
    
    //Pixellate();
}


void Pixellate() {
  for (int u = 0; u< width; u+= gX) {
    for (int v = 0; v< height; v+= gY) {
      color fColor = get(u, v);
      fill(fColor);      
      rect(u, v, gX, gY);
    }
  }
}
