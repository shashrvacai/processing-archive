PGraphics pg;


void setup() {
  size(800, 800, P2D);

  pg = createGraphics(width, height, P2D);
}

void draw() {  

for (int ti = 0 ; ti < width ;ti ++) {
    pg.beginDraw();
    
    pg.endDraw();
    pg.save("output/ti"+ti+".png"); 
    
  }
image(pg, 0, 0);
}
