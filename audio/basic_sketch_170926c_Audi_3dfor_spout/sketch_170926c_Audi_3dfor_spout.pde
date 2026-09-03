//import spout.*;
import processing.sound.*;     // check if you have this lib (SOUND)... or install it from the add library 

FFT fft;
AudioIn in;
//Spout spout;
int b =512;       // do not change FFT band widht 
float A = 0 ;    // angle of rotation   START ANGLE 
float[] spectrum = new float[b]; 

void setup() {
  size(1000, 1000, P3D);         // size of the canvas
  background(255);              //start BG color
  fft = new FFT(this, b);    
  in = new AudioIn(this, 0);
  in.start();
  //spout = new Spout(this);
  //spout.createSender(“Spout Processing”);

  fft.input(in);
}      

void draw() { 
  //spout.sendTexture();  
  background(0);
  fft.analyze(spectrum);            
  for (int i = 0; i < 512; i+=10) {
    //camera(width/2, mouseY, (height/2) / tan(PI/6), width/2, mouseY, 0, 0, 1, 0)      -----> remove (//) move the the cam with mouse 
    camera(width/4, height/4, (height/2) / tan(PI/6), width/4, height/4, 0, 0, 1, 0);   ///------ Add (//) .. comment this line

    noFill();
    float S = spectrum[i]*height*25; //  sound spectrum  do not touch
    stroke(255,255);    // color of the outline 

    pushMatrix();
      translate(width/2, 0, -100);
      pushMatrix();
        strokeWeight(0.1);
        rotateY(-A);
        rotateZ(-A);
        sphere(b/2);             // -------> sphere 
       // TRIAD  
          pushMatrix();
            rotateZ(2*A);
            rotateX(-A*3);
            translate(-600,0,0);
                strokeWeight(2);
                stroke(255,50);
                float P = -200 , Q = 200 , R = 0  ;
                   beginShape();
                      vertex(P, P, P);
                      vertex( Q, P, P);
                      vertex(   R, R, Q);
            
                      vertex( Q, P, P);
                      vertex( Q, Q, P);
                      vertex(   R, R, Q);
            
                      vertex( Q, Q, P);
                      vertex(P, Q, P);
                      vertex( R, R, Q);
            
                      vertex(P, Q, P);
                      vertex(P, P, P);
                      vertex(  R,R, Q);
                  endShape();
             popMatrix();
        popMatrix();
    
    
    // outer sphere  ----> 
        pushMatrix();
            noFill();
            translate(-width/2, height/2, 100);
            rotateZ(A);
            rotateX(A);
            rotateY(A);
            strokeWeight(0.1);
            //fill(15,150,200, 50);
            //sphere(3*b);
        popMatrix();


// dots and ellipse visualizer 
        pushMatrix();
          strokeWeight(1);
          translate(-width/2, height/2);
          rotateZ(A/3);
          ellipse(i, S, 10, 10);
          point(-i, S);
          ellipse(i, -S, 10, 10);
          point(-i, -S);
          popMatrix();
    popMatrix();

    A+=0.00001*S;      /// this is the angle of rotation     remove the S to disconnect from sound  . 
  }
}