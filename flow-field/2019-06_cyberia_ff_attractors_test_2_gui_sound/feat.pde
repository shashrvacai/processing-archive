float impulse_max = 256;
float impulse_mul = 15;
float impulse_tsmooth = 0.90f;
int   impulse_blur  = 0;

public void addImpulse() {    
  // impulse center/velocity
  float mx = mouseX;
  float my = mouseY;
  float vx = (mouseX - pmouseX) * +impulse_mul;
  float vy = (mouseY - pmouseY) * -impulse_mul; // flip vertically
  // clamp velocity
  float vv_sq = vx*vx + vy*vy;
  float vv_sq_max = impulse_max*impulse_max;
  if (vv_sq > vv_sq_max) {
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
  if (mousePressed && mouseButton != RIGHT) {
    pg_impulse.fill(vx, vy, mid);
    pg_impulse.ellipse(mx, my, 100, 100);
  }
  pg_impulse.endDraw();

  // create impulse texture
  ff_impulse.resize(width, height);
  {
    Merge.TexMad ta = new Merge.TexMad(ff_impulse.tex_vel, impulse_tsmooth, 0);
    Merge.TexMad tb = new Merge.TexMad(pg_impulse, 1, -mid/255f);
    DwFilter.get(context).merge.apply(ff_impulse.tex_vel, ta, tb);
    ff_impulse.blur(1, impulse_blur);
  }
}


public void addAttractors() {
  int w = width;
  int h = height;

  int     attr_num = mobs.length;
  float[] attr_mass = new float[attr_num];
  float[] attr_pos  = new float[attr_num*2];

  for (int i = 0; i < mobs.length; i++) {
    attr_mass[i] = 1f;
    attr_pos[i*2+0] =  width/2+400*sin(aa/2);;
    attr_pos[i*2+1] =height/2+400*cos(aa/2); // height-1-mobs[i].py;    //    -----------------------position of attractorr
  }

  context.begin();
  ff_attractors.resize(w, h);
  context.beginDraw(ff_attractors.tex_vel);
  shd_attractors.frag.setDefine("ATTRACTOR_NUM", attr_num);
  shd_attractors.begin();
  shd_attractors.uniform1f ("attractor_mult", mul_attractors);
  shd_attractors.uniform1fv("attractor_mass", attr_num, attr_mass);
  shd_attractors.uniform2fv("attractor_pos", attr_num, attr_pos );
  shd_attractors.drawFullScreenQuad();
  shd_attractors.end();
  context.endDraw();
  context.end();
}



public void particleSimulation() {

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
  // update obstacles, in case something changed
  if (UPDATE_OBSTACLES) {
    particles.createObstacleFlowField(pg_obstacles, BG, true);
  }

  if (UPDATE_PHYSICS) {
    // update physics
    particles.update(ff_acc);
  }
}
