class Box {
  
  Body  body ;
  float x, y;
  float w, h ;
  
  Box(float x_ , float y_){
    w  = random(2,40) ;
    h = random(2,50) ;
    makeBody(new Vec2(x_,y_),w,h);
  }
  
  void killBody(){
    box2d.destroyBody(body);
  }
  
  boolean done(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height+w*h){
      killBody();
      return true;
    }else {
     return false;
    }
  }
  
  void show(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a  = body.getAngle();
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    noFill();
    stroke(0);
    rect(0,0,w,h);  
    popMatrix();    
  }
  
  void makeBody(Vec2 center , float w_, float h_ ){
    PolygonShape sd = new PolygonShape();
    float box2dW =  box2d.scalarPixelsToWorld(w_/2);
    float box2dH =  box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW,box2dH);
    
    //CircleShape sd = new CircleShape();
    //sd.m_radius = box2d.scalarPixelsToWorld(w_/2);
    
    
    FixtureDef fd = new FixtureDef();
    fd.shape = sd ;
    fd.density = 1 ;
    fd.friction = 0.3 ;
    fd.restitution = 0.5 ;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC ;
    bd.position.set(box2d.coordPixelsToWorld(center));
    
    body = box2d.createBody(bd); 
    body.createFixture(fd);
    
    body.setLinearVelocity(new Vec2(random(-5, 5),random(-5,5)));
    body.setAngularVelocity(random(-5,5));
  }
}
