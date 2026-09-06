class LL {
  Body body ;
  float w, h, r ;

  LL(float x_, float y_) {
    w = 8 ;
    h = 24 ;
    r = 8 ;
    makeBody(new Vec2(x_, y_));
  }

  void killBody() {
    b2d.destroyBody(body);
  }

  boolean done() {
    Vec2 pos = b2d.getBodyPixelCoord(body);
    if (pos.y > height || pos.y < 0) {
      killBody();
      return true ;
    }
    return false ;
  }

  void show(){
    Vec2 pos = b2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    rectMode(CENTER);
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(-a);
      rect(0,0,w,h);
      ellipse(0,-h/2,r*2,r*2);
    popMatrix();
  }

  void makeBody(Vec2 c_) {
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(b2d.coordPixelsToWorld(c_));
    body = b2d.createBody(bd);

    CircleShape c = new CircleShape();
    c.m_radius = b2d.scalarPixelsToWorld(r);
    Vec2  off = new Vec2(0, -h/2);
    off = b2d.vectorPixelsToWorld(off);
    c.m_p.set(off.x, off.y);

    PolygonShape ps = new PolygonShape();
    float b2dW = b2d.scalarPixelsToWorld(w/2);
    float b2dH = b2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(b2dW, b2dH);

    body.createFixture(ps, 1);
    body.createFixture(c, 1);

    body.setLinearVelocity(new Vec2(random(5, -5), random(5, -5)));
    body.setAngularVelocity(random(5, -5));
  }
}