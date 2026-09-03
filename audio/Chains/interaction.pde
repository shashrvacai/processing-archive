public void initBodies() {

  physics.reset();

  softbodies = new ArrayList<DwSoftBody2D>();


  // particle parameters: same behavior for all
  DwParticle.Param param_particle = new DwParticle.Param();

  // spring parameters: different spring behavior for different bodies
  DwSpringConstraint.Param param_spring_cloth    = new DwSpringConstraint.Param();
  DwSpringConstraint.Param param_spring_softbody = new DwSpringConstraint.Param();
  DwSpringConstraint.Param param_spring_chain    = new DwSpringConstraint.Param();
  DwSpringConstraint.Param param_spring_circle   = new DwSpringConstraint.Param();

  // particle parameters
  param_particle.DAMP_BOUNDS     = 0.40f;
  param_particle.DAMP_COLLISION  = 0.9990f;
  param_particle.DAMP_VELOCITY   = 0.991f; 

  // spring parameters
  param_spring_cloth   .damp_dec = 0.999999f;
  param_spring_cloth   .damp_inc = 0.000599f;

  param_spring_softbody.damp_dec = 0.999999f;
  param_spring_softbody.damp_inc = 0.999999f;

  param_spring_chain   .damp_dec = 0.699999f;
  param_spring_chain   .damp_inc = 0.00099999f;

  param_spring_circle  .damp_dec = 0.999999f;
  param_spring_circle  .damp_inc = 0.999999f;



  int nodex_x, nodes_y, nodes_r;
  float nodes_start_x, nodes_start_y;
  // chain
  { 
    nodes_start_x = 100;
    nodes_start_y = 0;
    nodex_x = 1;
    nodes_y = picNum;
    nodes_r = 2;
    DwSoftGrid2D body = chain;
    body.CREATE_BEND_SPRINGS    = false;
    body.CREATE_SHEAR_SPRINGS   = false;
    body.self_collisions        = true; 
    body.collision_radius_scale = 1.00f; 
    body.setParam(param_particle);
    body.setParam(param_spring_chain);
    body.create(physics, nodex_x, nodes_y, nodes_r, nodes_start_x, nodes_start_y);
    body.getNode(0, 0).enable(false, false, false); // fix node to current location
    body.setParticleColor(color(0, 128));
    body.createShapeParticles(this);
    softbodies.add(body);
  }
}

//////////////////////////////////////////////////////////////////////////////
// User Interaction
//////////////////////////////////////////////////////////////////////////////

DwParticle particle_mouse = null;

public DwParticle findNearestParticle(float mx, float my) {
  return findNearestParticle(mx, my, Float.MAX_VALUE);
}

public DwParticle findNearestParticle(float mx, float my, float search_radius) {
  float dd_min_sq = search_radius * search_radius;
  DwParticle2D[] particles = physics.getParticles();
  DwParticle particle = null;
  for (int i = 0; i < particles.length; i++) {
    float dx = mx - particles[i].cx;
    float dy = my - particles[i].cy;
    float dd_sq =  dx*dx + dy*dy;
    if ( dd_sq < dd_min_sq) {
      dd_min_sq = dd_sq;
      particle = particles[i];
    }
  }
  return particle;
}

public ArrayList<DwParticle> findParticlesWithinRadius(float mx, float my, float search_radius) {
  float dd_min_sq = search_radius * search_radius;
  DwParticle2D[] particles = physics.getParticles();
  ArrayList<DwParticle> list = new ArrayList<DwParticle>();
  for (int i = 0; i < particles.length; i++) {
    float dx = mx - particles[i].cx;
    float dy = my - particles[i].cy;
    float dd_sq =  dx*dx + dy*dy;
    if (dd_sq < dd_min_sq) {
      list.add(particles[i]);
    }
  }
  return list;
}


public void updateMouseInteractions() {
  // deleting springs/constraints between particles
  if (DELETE_SPRINGS) {
    ArrayList<DwParticle> list = findParticlesWithinRadius(mouseX, mouseY, DELETE_RADIUS);
    for (DwParticle tmp : list) {
      tmp.enableAllSprings(false);
      tmp.collision_group = physics.getNewCollisionGroupId();
      tmp.rad_collision = tmp.rad;
    }
  } else {
    if (particle_mouse != null) {
      float[] mouse = {mouseX, mouseY};
      particle_mouse.moveTo(mouse, 0.2f);
    }
  }
}


boolean DELETE_SPRINGS = false;
float   DELETE_RADIUS  = 20;

public void mousePressed() {
  if (mouseButton == RIGHT ) DELETE_SPRINGS = true;

  if (!DELETE_SPRINGS) {
    particle_mouse = findNearestParticle(mouseX, mouseY, 100);
    if (particle_mouse != null) particle_mouse.enable(false, false, false);
  }
}

public void mouseReleased() {
  if (particle_mouse != null && !DELETE_SPRINGS) {
    if (mouseButton == LEFT  ) particle_mouse.enable(true, true, true );
    if (mouseButton == CENTER) particle_mouse.enable(true, false, false);
    particle_mouse = null;
  }
  if (mouseButton == RIGHT ) DELETE_SPRINGS = false;
}

public void keyReleased() {
  if (key == 's') repairAllSprings();
  if (key == 'r') initBodies();
  if (key == 'm') applySpringMemoryEffect();
  if (key == '1') DISPLAY_MODE = 0;
  if (key == '2') DISPLAY_MODE = 1;
  if (key == 'p') DISPLAY_PARTICLES = !DISPLAY_PARTICLES;
}
