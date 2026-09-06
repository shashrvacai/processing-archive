void setup() {
  fullScreen(1);
  //size(800, 1200);
  background( 60 );
  noStroke();
}

void draw() {  //draw function loops
  FanSpin( 60 );
}

void FanSpin( int triangles ) {

  float alpha = (TWO_PI/triangles) ;
  float delta =  (frameCount*0.015) ;
  float h =200;   ///// --------------------------- brush size 
  float w = h * sin( alpha );
  int c = 0;


  if (mousePressed) {
    for (int i = 0; i< triangles; i++) {
      if ( i % 2 == 0) c = 0; 
      else c = 255;

      pushMatrix();
      translate( mouseX, mouseY );
      rotate( alpha * i +delta );
      fill( c );
      noStroke();
      triangle( 0, 0, 0, -h, w, -h);
      popMatrix();
    }
  }
  
}
void keyPressed(){
  if(key =='e')
    background(0);
  }
