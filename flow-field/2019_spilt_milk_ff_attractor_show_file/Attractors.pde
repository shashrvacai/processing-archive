public void addAttractors() {
  int w = width;
  int h = height;

  int     attr_num = mobs.length;
  float[] attr_mass = new float[attr_num];
  float[] attr_pos  = new float[attr_num*2];

  for (int i = 0; i < mobs.length; i++) {
    attr_mass[i] = 1f;
    attr_pos[i*2+0] = mobs[i].px;
    attr_pos[i*2+1] = height-1-mobs[i].py;
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
