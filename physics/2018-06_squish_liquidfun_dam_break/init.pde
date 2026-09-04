  //////////////////////////////////////////////////////////////////////////////
  // Scene Setup
  //////////////////////////////////////////////////////////////////////////////
 
  // https://github.com/jbox2d/jbox2d/blob/master/jbox2d-testbed/src/main/java/org/jbox2d/testbed/tests/DamBreak.java
  public void initScene() {
    
    float dimx = world.transform.box2d_dimx;
    float dimy = world.transform.box2d_dimy;
    
    float dimxh = dimx/2;
    float dimyh = dimy/2;
    
    float screen_scale = world.transform.screen_scale;
    float bdimx = world.transform.box2d_dimx;
    float bdimy = world.transform.box2d_dimy;
    float bhick = 20 / screen_scale;
    
    { 
      BodyDef bd = new BodyDef();
      Body ground = world.createBody(bd);
      PolygonShape sd = new PolygonShape();

     // sd.setAsBox(8,20, new Vec2(0, 10), 0);    // (w, h, vec2(x,y), ??) random conversion
      //      density is set to 0, which makes this body static (zero mass)
      //ground.createFixture(sd, 0);
      
  
     // sd.setAsBox(bdimx/3f, bhick/2f, new Vec2(-11, 60), radians(35));
      //ground.createFixture(sd, 0);
     // sd.setAsBox(bdimx/3f, bhick/2f, new Vec2(11, 60), radians(-35));
      //ground.createFixture(sd, 0);

      
      world.bodies.add(ground, true, color(0), !true, color(150), 1f);
    }
    
    {
      BodyDef bd = new BodyDef();
      Body ground = world.createBody(bd);

      ChainShape shape = new ChainShape();
      Vec2[] vertices = {new Vec2(-dimxh, 0), new Vec2(dimxh, 0), new Vec2(dimxh, dimy), new Vec2(-dimxh, dimy)};
      shape.createLoop(vertices, 4);
      ground.createFixture(shape, 0.0f);
      
      world.bodies.add(ground, false, color(0), true, color(0), 1f);
    }

    {
      PolygonShape shape = new PolygonShape();
      ParticleGroupDef pd = new ParticleGroupDef();
       
      pd.flags = 1
        | ParticleType.b2_waterParticle
    //    | ParticleType.b2_viscousParticle
  //       | ParticleType.b2_colorMixingParticle
     //    | ParticleType.b2_powderParticle
   //      | ParticleType.b2_springParticle
        | ParticleType.b2_tensileParticle
         ;
      
      float sx = dimxh * 0.35f;
      float sy = dimyh * 0.85f;
      
      shape.setAsBox(sx, sy, new Vec2(-dimxh/2, 10), 0);
      pd.shape = shape;
      pd.setColor(new Color3f(1f, 0f, 0.2));
      world.createParticleGroup(pd);
      
      shape.setAsBox(sx, sy, new Vec2(0, 10), 0);
      pd.shape = shape;
      pd.setColor(new Color3f(1f, 1f, 0));
      world.createParticleGroup(pd);
      
      shape.setAsBox(sx, sy, new Vec2(+dimxh/2, 10), 0);
      pd.shape = shape;
      pd.setColor(new Color3f(0f, 0.2f, 1f));
      world.createParticleGroup(pd);
    }
  }
