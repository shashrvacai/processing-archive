

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
  for (int i = 0; i < mobs.length; i++) {
    UPDATE_OBSTACLES |= mobs[i].moving;
  }

  // update obstacles, in case something changed
  if (UPDATE_OBSTACLES) {
    particles.createObstacleFlowField(pg_obstacles, BG, true);
  }

  if (UPDATE_PHYSICS) {
    // update physics
    particles.update(ff_acc);
  }
}
