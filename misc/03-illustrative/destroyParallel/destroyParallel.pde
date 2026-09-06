int X_STEP = 1;
int Y_STEP = 10;
int X, Y;
float FORCE_RADIOUS = 50; 
float MAX_FORCE = 5.0;
PVector[][] points;

void setup(){
  size(1000, 1000);
  stroke(255);
  noFill();
  X = int(width / X_STEP) + 1;
  Y = int(height / Y_STEP) + 1;
  points = new PVector[X][Y];
  for(int y = 0; y < Y; y += 1){
    for(int x = 0; x < X; x += 1){
      points[x][y] = new PVector(x * X_STEP, y * Y_STEP);
    }
  }
}

void keyPressed(){
  if(key == 'c'){
  points = new PVector[X][Y];
    for(int y = 0; y < Y; y += 1){
      for(int x = 0; x < X; x += 1){
        points[x][y] = new PVector(x * X_STEP, y * Y_STEP);
      }
    }  
  }
}

void draw(){
  background(0);
  
  for(int y = 0; y < Y; y += 1){
    strokeWeight(1);
    beginShape();
    curveVertex(points[0][y].x, points[0][y].y);
    for(int x = 0; x < X; x += 1){
      curveVertex(points[x][y].x, points[x][y].y);  
    }
    curveVertex(points[X - 1][y].x, points[X - 1][y].y);
    endShape();
  }
  if(mousePressed){
    PVector mouse = new PVector(mouseX, mouseY);
    for(int y = 0; y < Y; y += 1){
      for(int x = 0; x < X; x += 1){
        float d = PVector.dist(points[x][y], mouse);
        if(d < FORCE_RADIOUS){
          PVector force = PVector.sub(points[x][y], mouse);
          force.normalize();
          force.mult(map(d, 0, FORCE_RADIOUS, MAX_FORCE, 0));
          points[x][y].add(force);
        }
      }
    }    
  }
}
