float a  =0 ;

void setup() {
  size(500, 500);
  surface.setResizable(true);
  smooth();
}

void DRR(float x_, float y_, float sz_, float r_  ) {
  translate(x_, y_);
  rotate(r_);
  
  ellipse( sz_, sz_,10,10);
  resetMatrix();
}

void draw() {
  background(0);
  PVector mouse = new PVector(mouseX, mouseY); 
  
  for (int x = 50; x < width; x+= 50 ) {
    for (int y = 50; y < height; y+= 50 ) {
      DRR( x ,  y, 20,a + x + y);
      PVector pos = new PVector(x,y);
     PVector dist = pos.sub(mouse);
     float d = dist.mag();
     float Sw = map(d ,0, 2*width, 0,50);
     strokeWeight(Sw);
     stroke(Sw*4,5,255-Sw*4);
     noFill();
     //fill(255);
    }
  }
  
  a+= 0.01;
  
}