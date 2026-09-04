void updateScene() {

  int w = width;
  int h = height;
  float dim = 2* h/3f;

  pg_obstacles.beginDraw();
  pg_obstacles.clear();
  pg_obstacles.noStroke();
  pg_obstacles.blendMode(REPLACE);
  pg_obstacles.rectMode(CORNER);

  // border
  pg_obstacles.fill(0, 255);
  pg_obstacles.rect(0, 0, w, h);
  pg_obstacles.fill(0, 0);
  pg_obstacles.rect(10, 10, w-20, h-20);

    pg_obstacles.fill(0, 255);
  // animated obstacles
  pg_obstacles.rectMode(CENTER);
  pg_obstacles.pushMatrix();
    pg_obstacles.translate(w/2-40, h/8);  
    pg_obstacles.rotate(PI/3);
    pg_obstacles.rect(0, 0, 4, 660);
  pg_obstacles.popMatrix();
  
  pg_obstacles.pushMatrix(); 
    pg_obstacles.translate(w/2-80, h/4+20);  
    pg_obstacles.rotate(PI/3);
    pg_obstacles.rect(0, 0, 4, 760);
  pg_obstacles.popMatrix();
 
    pg_obstacles.rect(700, h/2-170, 160, 4);  
   pg_obstacles.pushMatrix(); 
    pg_obstacles.translate(w/2-20, h/2-25);  
    pg_obstacles.rotate(PI/3);
    pg_obstacles.rect(0, 0, 4, 580);
  pg_obstacles.popMatrix();
  
    pg_obstacles.pushMatrix(); 
    pg_obstacles.translate(w/2-80, 3*h/4-150);  
    pg_obstacles.rotate(PI/3);
    pg_obstacles.rect(0, 0, 4, 760);
  pg_obstacles.popMatrix();
  
  pg_obstacles.endDraw();
}
