class Par {

  Body  body ;
  float r ;

  Par(float x_, float y_, float r_) {
    r = r_;
    makeBody(x_, y_, r);
  }

  void killBody() {
    box2d.destroyBody(body);
  }

  boolean done() {
    Vec2 pos =  box2d.getBodyPixelCoord(body);
    if (pos.y > height+(r*2)) {
      killBody();
      return true;
    } else {
      return false ;
    }
  }

  void show() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a  = body.getAngle();
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(-a);
      fill(0);
      stroke(255);
      ellipse(0,0,r*2,2*2);
      

    popMatrix();
  }

  void makeBody(float p_, float q_, float s_) {
    BodyDef  bd = new BodyDef();
    bd.position = box2d.coordPixelsToWorld(p_, q_);
    bd.type = BodyType.DYNAMIC ;
    body = box2d.world.createBody(bd);

    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(s_);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs ;
    fd.density = 1 ;
    fd.friction = 0.01 ;
    fd.restitution = 0.03; 

    body.createFixture(fd);

    body.setLinearVelocity(new Vec2(random(-10f, 10f), random(-10f, 10f)));
    body.setAngularVelocity(random(-10, 10));
  }
}