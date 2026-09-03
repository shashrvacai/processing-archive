float n = 20 ;
float a = 20 ;
void setup() {
  size( 640,640);
  surface.setResizable(true);
  rectMode(CENTER);
}
void draw() {
  background(255);
  noStroke();
  fill(0);
  rotate(-PI/2);
  translate(-width,0);
  //
  
  for (int i=0; i<width/n; i++) {
    for (int j=0; j<height/n; j++) {
      if ((i+j)%2==0) {
        pushMatrix();
        translate(n*i, n*j);
        rotate(a*i);
        float nx = map(sin(a), -1, 1, n, n/3);
        float ny = map(cos(a), 1, -1, n, n*3);
        rect(0, 0, ny, nx);

        popMatrix();
      }
      a+= j*0.0000001 ;
    }
  }
}

void keyTyped() {
  if (key =='r') {  
    setup() ;
  }
}
