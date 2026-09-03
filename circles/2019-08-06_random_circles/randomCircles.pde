float A = 0.0, S = 0.005 ;

void setup() {
  size(600, 600);
}

void draw() {
  pushMatrix();
  fill(255, 5);
  rect(0, 0, width, height);
  popMatrix();

  float L0 = map(mouseX, 0, width, 10, 300);    
  float L1 = map(mouseY, 0, height, 10, 300 );

  translate(width/2, height/2);
  rotate(A);
  for (int i = 0; i < 9; i++) {
    pushMatrix();
   
    rotate(i*TWO_PI/9);   
    translate(0, L0); 
    //ellipse(0, 0, 50, 50);   // raduis of primary circle
    noFill();
    rotate(A);
    for (int j =0; j<5; j++) {
      pushMatrix();
      rotate(j*TWO_PI/5);
      translate(0, L1);
      ellipse(0, 0, 30, 30);    // raduis of secondary circle


      rotate(A);
      for (int k =0; k<8; k++) { // inc the number of circles 
        pushMatrix();
        rotate(k*TWO_PI/5);  
        translate(0, L1);
        ellipse(0, 0, 10, 10); //  small babies
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }
  A += S;
}
