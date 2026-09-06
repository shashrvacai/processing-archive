class Bound {
  float x, y, w, h ;
  Body b ;

  Bound(float x_, float y_, float w_, float h_, float a_) {
    w = w_;
    x = x_ ;
    y = y_ ;
    h = h_ ;

    PolygonShape sd = new PolygonShape();
    float b2dW = b2d.scalarPixelsToWorld(w/2);
    float b2dH = b2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(b2dW, b2dH);

    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC ;
    bd.angle = a_ ;
    bd.position.set(b2d.coordPixelsToWorld(x, y));
    b = b2d.createBody(bd);
    
    b.createFixture(sd,1);
  }
  
  void show(){
    fill(0);
    stroke(0);
    strokeWeight(1);
    rectMode(CENTER);

    float a = b.getAngle();

    pushMatrix();
    translate(x,y);
    rotate(-a);
    rect(0,0,w,h);
    popMatrix();
  }
  }