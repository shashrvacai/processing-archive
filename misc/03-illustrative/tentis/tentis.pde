
ArrayList<Tenticle> T ;


void setup() {
  size(1000, 1000);
  strokeWeight(20.0);
  stroke(255);
  noCursor();

  T = new ArrayList<Tenticle>();
  for (int i = 100; i < 200; i+=50) {  
    for (int j = 100; j < 900; j+=20) {
      T.add(new Tenticle(20, 20, i, j));  // Position , MS mF
    }
  }
  
   for (int i = 851; i < 950; i+=50) {  
    for (int j = 100; j < 900; j+=20) {
      T.add(new Tenticle(20, 20, i, j));  // Position , MS mF
    }
  }
}

void draw() {

  pushMatrix();
  noStroke();
  fill(0);
  rect(0, 0, width, height);
  popMatrix();

  for (Tenticle tt : T) {
   tt.update();
  }
}
