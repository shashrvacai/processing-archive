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

  
  pg_obstacles.endDraw();
}
