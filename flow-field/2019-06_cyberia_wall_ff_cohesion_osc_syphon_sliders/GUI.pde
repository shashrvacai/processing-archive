  //////////////////////////////////////////////////////////////////////////////
  //
  // GUI
  // Helper
  // Parameters
  // Interaction (Mouse, Keys)
  //
  //////////////////////////////////////////////////////////////////////////////
  
  static class MouseObstacle{
    int idx = 0;
    float px = 500;
    float py = 200;
    float r  = 60;
    float dx, dy;
    boolean moving = false;
    
    public MouseObstacle(int idx, float px, float py, float r){
      this.idx = idx;
      this.px = px;
      this.py = py;
      this.r = r;
    }
    void draw(PGraphics pg, int[] rgba){
      int cr = rgba[0];
      int cg = rgba[1];
      int cb = rgba[2];
      int ca = 255;
      
      pg.noStroke();
      pg.fill(cr,cg,cb,ca);
      pg.ellipse(px, py, r*2, r*2);
    }
    public boolean inside(float mx, float my){
      dx = px - mx;
      dy = py - my;
      return (dx*dx + dy*dy) < (r*r);
    } 
    public void startMove(float mx, float my){
      moving = inside(mx, my);
    }
    public void move(float mx, float my){
      if(moving){
        px = mx + dx;
        py = my + dy;
      }
    }
    public void endMove(float mx, float my){
      moving = false;
    }
  }
  
  public void mousePressed(){
    if(mouseButton == RIGHT && !cp5.isMouseOver()){
      //for(int i = 0; i < mobs.length; i++){
        //mobs[i].startMove(mouseX, mouseY);
      }
    //}
  }

  public void mouseDragged(){
    for(int i = 0; i < mobs.length; i++){
      mobs[i].move(mouseX, mouseY);
    }
  }
  
  public void mouseReleased(){
    for(int i = 0; i < mobs.length; i++){
      mobs[i].endMove(mouseX, mouseY);
    }
  }
  
  
  public void keyReleased(){
    if(key == 'r') reset();
    if(key == 't') UPDATE_PHYSICS = !UPDATE_PHYSICS;
    if(key == 'h') toggleGUI(); 
  }
  
  public void toggleGUI(){
    if(cp5.isVisible()){
      cp5.hide();
    } else {
      cp5.show();
    }
  }
  
  
  public void spawn(int rad, int count){
    int vw = width;
    int vh = height;
    int px = mouseX;
    int py = mouseY; py = vh - 1 - py;
    
    DwFlowFieldParticles.SpawnRadial sr = new DwFlowFieldParticles.SpawnRadial();
    sr.num(count);
    sr.dim(rad, rad);
    sr.pos(px, py);
    
    particles.spawn(vw, vh, sr);
  }
  

  public void reset(){
    particles.reset();
  }
  public void set_size_display(int val){
    particles.param.size_display = val;
  }
  public void set_size_cohesion(int val){
    particles.param.size_cohesion = val;  
  }
  public void set_size_collision(int val){
    particles.param.size_collision = val;  
  }
  public void set_velocity_damping(float val){
    particles.param.velocity_damping = val;  
  }
  public void set_collision_steps(int val){
    particles.param.steps = val;
  }
  public void set_mul_acc(float val){
    particles.param.mul_acc = val;
  }
  public void set_mul_col(float val){
    particles.param.mul_col = val;
  }
  public void set_mul_coh(float val){
    particles.param.mul_coh = val;
  }
  public void set_mul_obs(float val){
    particles.param.mul_obs = val;
  }
  public void set_shader_collision_mult(float val){
    particles.param.shader_collision_mult = val;
  }

  public void setParticleColor(int val){
    float r=1f, g=1f, b=1f, a=1f, s=1f;
    float[] ca = particles.param.col_A;
    switch(val){
      case 0: r = 0.10f; g = 0.50f; b = 1.00f; a = 10.0f; s = 0.50f;  break;
      case 1: r = 0.40f; g = 0.80f; b = 0.10f; a = 10.0f; s = 0.50f;  break;
      case 2: r = 0.80f; g = 0.40f; b = 0.10f; a = 10.0f; s = 0.50f;  break;
      case 3: r = 0.50f; g = 0.50f; b = 0.50f; a = 10.0f; s = 0.25f;  break;
      case 4: r = ca[0]; g = ca[1]; b = ca[2]; a =  1.0f; s = 1.00f;  break;
    }
    particles.param.col_A = new float[]{ r  , g  , b  , a };
    particles.param.col_B = new float[]{ r*s, g*s, b*s, 0 };
  }
  
  public void updateSelections(float[] val){
    int ID = 0;
    AUTO_SPAWN          = val[ID++] > 0;
    APPLY_BLOOM         = val[ID++] > 0;
  }
  

  float mult_fg = 1f;
  float mult_active = 2f;
  float CR = 96;
  float CG = 16;
  float CB =  0;
  
  int col_bg    ;
  int col_fg    ;
  int col_active;
  
  ControlP5 cp5;
  
  public void createGUI(){
    
    col_bg     = color(16);
    col_fg     = color(CR*mult_fg, CG*mult_fg, CB*mult_fg);
    col_active = color(CR*mult_active, CG*mult_active, CB*mult_active);
    
    int col_group = color(8,224);
    
    CColor theme = ControlP5.getColor();
    theme.setForeground(col_fg);
    theme.setBackground(col_bg);
    theme.setActive(col_active);

    cp5 = new ControlP5(this);
    cp5.setAutoDraw(true);
    
    int sx, sy, px, py;
    sx = 100; 
    sy = 14; 

    int dy_group = 20;
    int dy_item = 4;

    ////////////////////////////////////////////////////////////////////////////
    // GUI - FLUID
    ////////////////////////////////////////////////////////////////////////////
    Group group_particles = cp5.addGroup("particles");
    {
      group_particles.setHeight(20).setSize(gui_w, 370)
      .setBackgroundColor(col_group).setColorBackground(col_group);
      group_particles.getCaptionLabel().align(CENTER, CENTER);
      
      px = 15; py = 15;
      
      cp5.addButton("reset").setGroup(group_particles).plugTo(this, "reset"     ).setSize(80, 18).setPosition(px, py);

      py += sy + dy_group;
      cp5.addSlider("collision steps").setGroup(group_particles).setSize(sx, sy).setPosition(px, py)
      .setRange(0, 3).setValue(particles.param.steps).plugTo(this, "set_collision_steps")
      .snapToTickMarks(true).setNumberOfTickMarks(4);
      py += sy + dy_group;
      
      cp5.addSlider("damping").setGroup(group_particles).setSize(sx, sy).setPosition(px, py)
      .setRange(0.95f, 1.00f).setValue(particles.param.velocity_damping).plugTo(this, "set_velocity_damping");
      py += sy + dy_group;
      

      cp5.addSlider("attractors").setGroup(group_particles).setSize(sx, sy).setPosition(px, py)
      .setRange(0, 10).setValue(mul_attractors).plugTo(this, "mul_attractors");
      py += sy + dy_group;

      
      cp5.addSlider("size display").setGroup(group_particles).setSize(sx, sy).setPosition(px, py)
      .setRange(0, 20).setValue(particles.param.size_display).plugTo(this, "set_size_display");
      py += sy + dy_item;
      
      cp5.addSlider("size collision").setGroup(group_particles).setSize(sx, sy).setPosition(px, py)
      .setRange(1, 20).setValue(particles.param.size_collision).plugTo(this, "set_size_collision");
      py += sy + dy_item;
      
      cp5.addSlider("size cohesion").setGroup(group_particles).setSize(sx, sy).setPosition(px, py)
      .setRange(1, 40).setValue(particles.param.size_cohesion).plugTo(this, "set_size_cohesion");
      py += sy + dy_group;
      

      cp5.addSlider("mult collision").setGroup(group_particles).setSize(sx, sy).setPosition(px, py)
      .setRange(0.0f, 8.0f).setValue(particles.param.mul_col).plugTo(this, "set_mul_col");
      py += sy + dy_item;
      
      cp5.addSlider("mult cohesion").setGroup(group_particles).setSize(sx, sy).setPosition(px, py)
      .setRange(0.0f, 8.0f).setValue(particles.param.mul_coh).plugTo(this, "set_mul_coh");
      py += sy + dy_item;
      
      cp5.addSlider("mult obstacles").setGroup(group_particles).setSize(sx, sy).setPosition(px, py)
      .setRange(0.0f, 8.0f).setValue(particles.param.mul_obs).plugTo(this, "set_mul_obs");
      py += sy + dy_group;
      

      int ID = -1;
      cp5.addCheckBox("updateSelections").setGroup(group_particles).setSize(sy,sy).setPosition(px, py)
          .setSpacingColumn(2).setSpacingRow(2).setItemsPerRow(1)

          .addItem("AUTO SPAWN"         , ++ID).activate(AUTO_SPAWN          ? ID : 10)
          .addItem("APPLY BLOOM"        , ++ID).activate(APPLY_BLOOM         ? ID : 10)
        ; 
    }

    ////////////////////////////////////////////////////////////////////////////
    // GUI - ACCORDION
    ////////////////////////////////////////////////////////////////////////////
    cp5.addAccordion("acc").setPosition(gui_x, gui_y).setWidth(gui_w).setSize(gui_w, height)
      .setCollapseMode(Accordion.MULTI)
      .addItem(group_particles)
      .open()
      ;

  }
