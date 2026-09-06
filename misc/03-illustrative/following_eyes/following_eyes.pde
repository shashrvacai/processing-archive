ArrayList<Eye> E ;
int dist =  70 ;


void setup() {
  surface.setResizable(true);
  size(600, 600);
  noStroke();
  E = new ArrayList<Eye>();

  for (int eN = 0; eN < 20; eN ++) {
    for (int i = dist; i < width; i += dist) {
      for (int j = dist; j < width; j += dist) {
           
        
          E.add(new Eye(i, j, 50));
          
      }
    }
  }
}

void draw() {
  background(150);

  for (Eye ee : E) {
    ee.update(mouseX, mouseY);
    ee.display();
  }
}
