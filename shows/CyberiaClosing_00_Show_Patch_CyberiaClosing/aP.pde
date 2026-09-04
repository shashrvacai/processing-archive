  
  float impulse_max = 256;
  float impulse_mul = 15;
  float impulse_tsmooth = 0.90f;
  int   impulse_blur  = 0;
   

   
 public void addAttractors(){
    int w = width;
    int h = height;
    
    int     attr_num = mobs.length;
    float[] attr_mass = new float[attr_num];
    float[] attr_pos  = new float[attr_num*2];
    
    for(int i = 0; i < mobs.length; i++){
      attr_mass[i] = 1f;
      attr_pos[i*2+0] = mouseX;
      attr_pos[i*2+1] =height-mouseY; // height-1-mobs[i].py;    //    -----------------------position of attractorr
    }
    
    context.begin();
    ff_attractors.resize(w, h);
    context.beginDraw(ff_attractors.tex_vel);
    shd_attractors.frag.setDefine("ATTRACTOR_NUM", attr_num);
    shd_attractors.begin();
    shd_attractors.uniform1f ("attractor_mult", mul_attractors);
    shd_attractors.uniform1fv("attractor_mass", attr_num, attr_mass);
    shd_attractors.uniform2fv("attractor_pos" , attr_num, attr_pos );
    shd_attractors.drawFullScreenQuad();
    shd_attractors.end();
    context.endDraw();
    context.end();
  }

public void addImpulse(){
    float mx = mouseX;
    float my = mouseY;
    float vx = (mouseX - pmouseX) * +impulse_mul;
    float vy = (mouseY - pmouseY) * -impulse_mul; // flip vertically
    // clamp velocity
    float vv_sq = vx*vx + vy*vy;
    float vv_sq_max = impulse_max*impulse_max;
    if(vv_sq > vv_sq_max){
      vx = impulse_max * vx / sqrt(vv_sq);
      vy = impulse_max * vy / sqrt(vv_sq);
    }
    // map velocity, to UNSIGNED_BYTE range
    final int mid = 127;
    vx = map(vx, -impulse_max, +impulse_max, 0, mid<<1);
    vy = map(vy, -impulse_max, +impulse_max, 0, mid<<1);
    // render "velocity"
    pg_impulse.beginDraw();
    pg_impulse.background(mid, mid, mid);
    pg_impulse.noStroke();
    if(mousePressed && mouseButton != RIGHT){
      pg_impulse.fill(vx, vy, mid);
      pg_impulse.ellipse(mx, my, 100, 100);
    }
    pg_impulse.endDraw();
    
    // create impulse texture
    ff_impulse.resize(width, height);
    {
      Merge.TexMad ta = new Merge.TexMad(ff_impulse.tex_vel, impulse_tsmooth, 0);
      Merge.TexMad tb = new Merge.TexMad(pg_impulse,  1, -mid/255f);
      DwFilter.get(context).merge.apply(ff_impulse.tex_vel, ta, tb);
      ff_impulse.blur(1, impulse_blur);
    }
  }
  
    public void particleSimulation(){
    int w = width;
    int h = height;

    // create acceleration texture
    ff_acc.resize(w, h);
    {
      Merge.TexMad ta = new Merge.TexMad(ff_impulse.tex_vel, 1, 0);
      Merge.TexMad tb = new Merge.TexMad(ff_attractors.tex_vel, 1, 0);
      DwFilter.get(context).merge.apply(ff_acc.tex_vel, ta, tb);
    }
    // resize buffers
    boolean resized = particles.resizeWorld(w, h);
    
    // check if obstacles changed
    boolean UPDATE_OBSTACLES = resized;
    //for(int i = 0; i < mobs.length; i++){
    //  UPDATE_OBSTACLES |= mobs[i].moving;
    //}
    
    // update obstacles, in case something changed
    if(UPDATE_OBSTACLES){
      particles.createObstacleFlowField(pg_obstacles, BG, true);
    }
    
    if(UPDATE_PHYSICS){
      // update physics
      particles.update(ff_acc);
    }
  }
  
  
  public boolean resizeScene() {

  boolean[] RESIZED = { false };
  pg_canvas     = DwUtils.changeTextureSize(this, pg_canvas, width, height, 0, RESIZED);
  pg_obstacles  = DwUtils.changeTextureSize(this, pg_obstacles, width, height, 0, RESIZED);
  pg_impulse    = DwUtils.changeTextureSize(this, pg_impulse, width, height, 0, RESIZED);
  pg_luminance  = DwUtils.changeTextureSize(this, pg_luminance, width, height, 0, RESIZED);


  return RESIZED[0];
}

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
  pg_obstacles.endDraw();
}

public void autoSpawnParticles() {
  if (AUTO_SPAWN && (frameCount%60) == 0) {
    float px = width/2;
    float py = height-100;

    DwFlowFieldParticles.SpawnRadial sr = new DwFlowFieldParticles.SpawnRadial();
    sr.num(1);
    sr.dim(10, 10);
    sr.pos(px, height-1 - py);
    sr.vel(0, 0);
    particles.spawn(width, height, sr);
  }
}

static class MouseObstacle {
  int idx = 0;
  float px = 500;
  float py = 200;
  float r  = 60;
  float dx, dy;
  boolean moving = false;

  public MouseObstacle(int idx, float px, float py, float r) {
    this.idx = idx;
    this.px = px;
    this.py = py;
    this.r = r;
  }
  void draw(PGraphics pg, int[] rgba) {
    int cr = rgba[0];
    int cg = rgba[1];
    int cb = rgba[2];
    int ca = 255;

    pg.noStroke();
    pg.fill(cr, cg, cb, ca);
    pg.ellipse(px, py, r*2, r*2);
  }
  public boolean inside(float mx, float my) {
    dx = px - mx;
    dy = py - my;
    return (dx*dx + dy*dy) < (r*r);
  } 
  public void startMove(float mx, float my) {
    moving = inside(mx, my);
  }
  public void move(float mx, float my) {
    if (moving) {
      px = mx + dx;
      py = my + dy;
    }
  }
  public void endMove(float mx, float my) {
    moving = false;
  }
}

public void spawn(int rad, int count) {
  int vw = width;
  int vh = height;
  int px = mouseX;
  int py = mouseY; 
  py = vh - 1 - py;
  DwFlowFieldParticles.SpawnRadial sr = new DwFlowFieldParticles.SpawnRadial();
  sr.num(count);
  sr.dim(rad, rad);
  sr.pos(px, py);
  particles.spawn(vw, vh, sr);
}
