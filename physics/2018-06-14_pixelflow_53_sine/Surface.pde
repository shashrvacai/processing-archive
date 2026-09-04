class Surface{
  ArrayList<Vec2> surface;
  
  Surface(){
    surface = new ArrayList<Vec2>();
   
    
    ChainShape chain = new ChainShape();
    
    float t = 0 ;
   
    for(float x = width+10 ; x >-10; x -=5){
      float y = map(cos(t),-1,1,75,height-10);
      t += 0.15;
      surface.add(new Vec2(x,y));
    }
    
    Vec2[] vertices = new Vec2[surface.size()];
    for(int i = 0 ; i < vertices.length ; i++){
      Vec2 edge= box2d.coordPixelsToWorld(surface.get(i)); 
      vertices[i]  = edge ;
    }
    
    chain.createChain(vertices, vertices.length);
    
    BodyDef bd = new BodyDef();
    Body body = box2d.world.createBody(bd);
    
    body.createFixture(chain,1);
  }    
  
  void show(){
    stroke(255);
     fill(0,20);
     beginShape();
       for (Vec2 v : surface){
         vertex(v.x,v.y);
       }
       vertex(width,height);
       vertex(0,height);
     endShape(CLOSE);
  }
}