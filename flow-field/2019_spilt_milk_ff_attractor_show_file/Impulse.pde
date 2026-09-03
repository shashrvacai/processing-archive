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
