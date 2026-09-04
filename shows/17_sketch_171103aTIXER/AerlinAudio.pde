class Perlin {

  int cols, rows;
  int scl= 20;
  int w = 1800;
  int h = 1800;

  float fly = 0;
  float [][] terrain;

  Perlin() {
    cols = w /scl;
    rows = h/scl;
    terrain = new float[cols][rows];
  }

  void run() {
    pushMatrix();
    fill(0, 5);
    translate(-500, -100, -750);
    rect(0, 0, width*4, height*3); 
    noFill();
    popMatrix();

    pushMatrix();
    fill(200, 90, 155,25);
    scale(0.5);
    
    rotateY(radians(320));
    translate(-200, 800, -1100);
    rotateX(radians(30));
    
   
   rect(0, 0, width*2, height*2);
    noFill();
    popMatrix();

    float Am = amp.analyze();
    float AmL = Am*1000;

    fly -= 0.005;
    float H = map(mouseY, 0, height, 0, 150);
    float  yOff =fly;
    for ( int y = 0; y < rows; y ++) {
      float xOff = 0;
      for (int x = 0; x < cols; x ++) {
        terrain[x][y] =  map(noise(xOff, yOff), 0, 1, -200, 200);  //with noise
        xOff+=0.1;
      }
      yOff +=0.1;
    }

    stroke(255);
    strokeWeight(5);
    noFill();

    translate(width/2, height/2);

    float mouse = map(mouseY, 0, width, -PI/2, PI/2);
    float mouseZ = map(mouseX, 0, height, -PI/2, PI/2);
    rotateX(radians(-135));
    rotateZ(radians(30));

    translate(-w/3, -h/2);
    for ( int y = 0; y < rows-1; y ++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols; x ++) {

        point(x*scl, y*scl, terrain[x][y]);
        //point(x*scl,(y+1)*scl,terrain[x][y+1]);
      }
      endShape();
    }
  }
}