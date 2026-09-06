class Planet {
  float raduis;
  float angle;
  float distance;
  Planet[] planets;
  float orbitSpeed;  
  PVector v;
  
  Planet(float r, float d, float o){
    v = PVector.random3D();
    raduis = r ;
    distance = d ;
    v.mult(distance);
    angle = random(TWO_PI);
    orbitSpeed = o ;
  }

  void spawnMoons(int total, int level){
    planets = new Planet[total];
    for (int i=0; i < planets.length; i++){
      float r = raduis/(level*2);
      float d = random((raduis+r),(raduis+r)*2);
      float o = random(-0.05,0.05);
      planets[i] = new Planet(r , d, o);
      if (level <2) {
        int num = 1; //int(random(0,4));
      planets[i].spawnMoons(num, level +1);
      }
    }
  }
  
  void orbit() {
    angle = angle + orbitSpeed;
       if (planets != null){
          for (int i=0; i < planets.length; i++){
          planets[i].orbit();
        }
      }
  }

  void show(){
    pushMatrix();
    //rotate(angle);
     translate(v.x,v.y,v.z);
    
    PVector v2 = new PVector(1,0,1);
    PVector p = v.cross(v2);
    rotate(angle,p.x,p.y,p.z);
    noStroke();
    fill(255);
    sphere(raduis);
    //ellipse(0,0,raduis*2,raduis*2);
    
    if (planets != null){
      for (int i=0; i < planets.length; i++){
        planets[i].show();
      }    
    }
    popMatrix();
  }

}