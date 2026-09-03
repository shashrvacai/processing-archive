

int[] BG      = { 0, 0, 0, 0};
int[] FG      = {16, 16, 16, 255};
int[] FG_MOBS = {96, 192, 255, 255};
void setFill(PGraphicsOpenGL pg, int[] rgba) {
  pg.fill(rgba[0], rgba[1], rgba[2], rgba[3]);
}

void updateScene() {
  int w = pg_obstacles.width;
  int h = pg_obstacles.height;

  pg_obstacles.beginDraw();
  pg_obstacles.clear();
  pg_obstacles.noStroke();
  pg_obstacles.blendMode(REPLACE);
  pg_obstacles.rectMode(CORNER);
  setFill(pg_obstacles, FG);
  pg_obstacles.rect(0, 0, w, h);
  setFill(pg_obstacles, BG);
  pg_obstacles.rect(10, 10, w-20, h-20);
  pg_obstacles.blendMode(BLEND);
  for (int i = 0; i < mobs.length; i++) {
    //mobs[i].draw(pg_obstacles, FG_MOBS);                              /// invisible attractors to draw
  }
  pg_obstacles.endDraw();
}


public void autoSpawnParticles() {
  if (AUTO_SPAWN && (frameCount%6) == 0) {
    float px = 100;
    float py = height-100;

    DwFlowFieldParticles.SpawnRadial sr = new DwFlowFieldParticles.SpawnRadial();
    sr.num(1);
    sr.dim(10, 10);
    sr.pos(px, height-1 - py);
    sr.vel(0, 0);
    particles.spawn(width, height, sr);

  }

  if (mousePressed) {     
    if (mouseButton == LEFT) {
      int count = ceil(particles.getCount() * 0.01f);
      count = min(max(count, 1), 50000);  
      int radius = ceil(sqrt(count));
      spawn(radius, count);
    }
  }
}


public boolean resizeScene() {

  boolean[] RESIZED = { false };
  pg_canvas     = DwUtils.changeTextureSize(this, pg_canvas, width, height, 0, RESIZED);
  pg_obstacles  = DwUtils.changeTextureSize(this, pg_obstacles, width, height, 0, RESIZED);
  pg_impulse    = DwUtils.changeTextureSize(this, pg_impulse, width, height, 0, RESIZED);
  pg_luminance  = DwUtils.changeTextureSize(this, pg_luminance, width, height, 0, RESIZED);

  if (RESIZED[0]) {
    setParticleColor(2);
  }
  return RESIZED[0];
}
