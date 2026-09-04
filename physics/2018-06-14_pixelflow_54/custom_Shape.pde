class Cs {
  Body body;
  
  Cs(float x_ , float y_){
    makeBody(new Vec2(x_,y_));
  }
  
  void killBody(){
    b2d.destroyBody(body);
  }
  
  boolean done(){
    Vec2 pos = b2d.getBodyPixelCoord(body);
    if(pos.y > height){
      killBody();
      return true ;
    }
    return false ;
  }
  
  void show(){
    Vec2 pos = b2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();
    
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(0);
    beginShape();
    for(int i = 0; i < ps.getVertexCount(); i++){
      Vec2 v = b2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x,v.y);
    }
    endShape(CLOSE);
    popMatrix();
    
  }
  
  void makeBody(Vec2 c_){
    
    Vec2[] vs = new Vec2[4]; // verticels of the polygon
    vs[0] = b2d.vectorPixelsToWorld(new Vec2(15,-15));
    vs[1] = b2d.vectorPixelsToWorld(new Vec2(15,25));
    vs[2] = b2d.vectorPixelsToWorld(new Vec2(-15,10));
    vs[3] = b2d.vectorPixelsToWorld(new Vec2(-15,-10));
    
    PolygonShape ps = new PolygonShape();
    ps.set(vs,vs.length);
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(b2d.coordPixelsToWorld(c_));
    body = b2d.createBody(bd);
    
    body.createFixture(ps,1);
    
    body.setLinearVelocity(new Vec2(random(-5,5),random(5,-5)));
    body.setAngularVelocity(random(-5,5));
  
  }

}