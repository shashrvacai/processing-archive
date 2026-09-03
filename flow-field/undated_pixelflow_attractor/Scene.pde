 
  //////////////////////////////////////////////////////////////////////////////
  //
  // SCENE
  //
  //////////////////////////////////////////////////////////////////////////////


  int[] BG      = { 0, 0, 0,  0};
  int[] FG      = {16,16,16,255};
  int[] FG_MOBS = {96,192,255,255};
  void setFill(PGraphicsOpenGL pg, int[] rgba){
    pg.fill(rgba[0], rgba[1], rgba[2], rgba[3]);
  }
  
  void updateScene(){
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
    for(int i = 0; i < mobs.length; i++){
      mobs[i].draw(pg_obstacles, FG_MOBS);
    }
    pg_obstacles.endDraw();
  }
  

  public void autoSpawnParticles(float ax_,float ay_,float aa_){
    if(AUTO_SPAWN && (frameCount%aa_) == 0){
      float px = ax_;
      float py = ay_;
      
      DwFlowFieldParticles.SpawnRadial sr = new DwFlowFieldParticles.SpawnRadial();
      sr.num(1);
      sr.dim(10, 10);
      sr.pos(px, height-1 - py);
      sr.vel(0, 0);
      particles.spawn(width, height, sr);
    }
   
  }
  
 
  
