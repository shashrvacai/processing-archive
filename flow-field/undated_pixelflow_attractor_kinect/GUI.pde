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
  
  public void keyReleased(){
    if(key == 'r') reset();
    if(key == 't') UPDATE_PHYSICS = !UPDATE_PHYSICS;
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
    DISPLAY_DIST        = val[ID++] > 0;
    DISPLAY_FLOW        = val[ID++] > 0;
    AUTO_SPAWN          = val[ID++] > 0;
    APPLY_BLOOM         = val[ID++] > 0;
  }
  