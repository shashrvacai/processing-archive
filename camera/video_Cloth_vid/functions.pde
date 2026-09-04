public void createBodies() {

  physics.reset();
  softbodies.clear();
  softbodies.add(cloth);

  cloth.setParticleColor(color(  0, 180, 255, 128));
  cloth.setMaterialColor(color(  0, 280, 255, 128));
  cloth.setParam(param_particle_cloth);
  cloth.setParam(param_spring_cloth);

  // both cloth are of the same size
  int nodes_x = 22;
  int nodes_y =60;
  int nodes_r = 16;
  int nodes_start_x = 0;
  int nodes_start_y = 80;

  int   num_cloth = softbodies.size();
  float cloth_width = 2 * nodes_r * (nodes_x-1);
  float spacing = ((viewport_w ) - num_cloth * cloth_width) / (float)(num_cloth+1);  

  // create all cloth in the list
  for (int i = 0; i < num_cloth; i++) {
    nodes_start_x += spacing + cloth_width * i;

    DwSoftGrid2D cloth = (DwSoftGrid2D) softbodies.get(i);
    cloth.create(physics, nodes_x, nodes_y, nodes_r, nodes_start_x, nodes_start_y);
    for (int v = 0 ;v <=cloth.nodes_x-1 ;v+=3){
    cloth.getNode(              v, 0).enable(false, false, false); // fix node to current location
    // fix node to current location
    }
    cloth.createShapeParticles(this);
  }
}

// this resets all springs and particles, to some of its initial states
// can be used after deactivating springs with the mouse
public void repairAllSprings() {
  for (DwSoftBody2D body : softbodies) {
    for (DwParticle pa : body.particles) {
      pa.setCollisionGroup(body.collision_group_id);
      pa.setRadiusCollision(pa.rad());
      pa.enableAllSprings(true);
    }
  }
}
// update all springs rest-lengths, based on current particle position
// the effect is, that the body keeps the current shape
public void applySpringMemoryEffect() {
  ArrayList<DwSpringConstraint> springs = physics.getSprings();
  for (DwSpringConstraint spring : springs) {
    spring.updateRestlength();
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
    ArrayList<DwParticle> list = findParticlesWithinRadius(width/2,height/2, DELETE_RADIUS);
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
float   DELETE_RADIUS = 100;

public void mousePressed() {
 
    if (mouseButton == RIGHT ) DELETE_SPRINGS = true; 
    if (!DELETE_SPRINGS) {
      particle_mouse = findNearestParticle(mouseX, mouseY, 100);
      if (particle_mouse != null) particle_mouse.enable(false, false, false);
    }
  
}

public void mouseReleased() {
  if (!DELETE_SPRINGS && particle_mouse != null) {
    if (mouseButton == LEFT  ) particle_mouse.enable(true, true, true);
    if (mouseButton == CENTER) particle_mouse.enable(true, false, false);
    particle_mouse = null;
  }
  if (mouseButton == RIGHT ) DELETE_SPRINGS = false;
}

public void keyReleased() {
  if (key == 's') repairAllSprings();
  if (key == 'm') applySpringMemoryEffect();

  if (key == 'r') createBodies();
  if (key == '1') DISPLAY_MODE = 0;
  if (key == '2') DISPLAY_MODE = 1;

  if (key == '3') DISPLAY_PARTICLES = !DISPLAY_PARTICLES;
  if (key == '4') DISPLAY_MESH      = !DISPLAY_MESH;
  if (key == '5') DISPLAY_SRPINGS   = !DISPLAY_SRPINGS;

  if (key == ' ') UPDATE_PHYSICS = !UPDATE_PHYSICS;
}
