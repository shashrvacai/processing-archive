float jump  = 50 ;
PVector pos, nOff ;


void setup() {
  background(0);
  size(600, 600, P3D);
  surface.setResizable(true);

  pos = new PVector(width/2, height/2, width/2);
  nOff = new PVector(random(10000), random(1000), random(1000));
  
  sphereDetail(4);
}

void draw() {
  background(0);
  pos.x = map(noise(nOff.x), 0, 1, 0, width);
  pos.y = map(noise(nOff.y), 0, 1, 0, height);
  pos.z = map(noise(nOff.y), 0, 1, 0, height);
  nOff.add(0.01, 0.01, 0);

  pushMatrix();
  fill(0, 255, 0);
  translate(pos.x, pos.y, pos.z);
  sphere(10);
  popMatrix();

  if (mousePressed) {
    lights();
  }

  for (int i = 100; i < width; i+= jump ) {
    for (int j = 100; j < width; j+= jump ) {
      for (int k = 100; k < width; k+= jump ) {

        PVector  RPos = new PVector(pos.x, pos.y, pos.z);
        PVector  LightPos = new PVector(i, j, k); 
        float d = RPos.dist(LightPos);
        //println(d);

        pushMatrix();
        translate(i, j, k);

        if (d < 2*jump) {
          fill(255, 0, 0);
          sphere(5);
        } else {  
          fill(255);
          sphere(5);
        }
        
        
        popMatrix();
      }
    }
  }
}
