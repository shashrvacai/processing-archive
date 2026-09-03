
import processing.sound.*;

FFT fft;
AudioIn in;
int b =1024;
float A = 0 ;    // angle of rotation
float[] spectrum = new float[b];

void setup() {
  size(1000, 1000, P3D);
  background(255);

  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, b);
  in = new AudioIn(this, 0);
  in.start();

  fft.input(in);
}      

void draw() { 
  background(0);
  fft.analyze(spectrum);
//directionalLight(255, 102, 126, 0, -0.1,0);
  for (int i = 0; i < 512; i+=10) {
    //camera(width/2, mouseY, (height/2) / tan(PI/6), width/2, mouseY, 0, 0, 1, 0)
    camera(width/4, height/4, (height/2) / tan(PI/6), width/4, height/4, 0, 0, 1, 0);
    

    noFill();
    float S = spectrum[i]*height*25; //  sound spectrum
    //float s = map(S , );
    stroke(255);

    pushMatrix();
      translate(width/2, 0, -100);
      pushMatrix();
        strokeWeight(0.1);
        //noFill();
        //fill(150, 50);
        rotateY(-A);
        rotateZ(-A);
        sphere(b/2);
      popMatrix();
      pushMatrix();
        noFill();
        translate(-width/2, height/2, 100);
        rotateZ(A);
        rotateX(A);
        rotateY(A);
        strokeWeight(0.1);
        //fill(15,150,200, 50);
        sphere(3*b);
      popMatrix();
        
      pushMatrix();
        strokeWeight(1);
        translate(-width/2,height/2);
        rotateZ(A/3);
        //rotateX(A);
        //rotateY(A);
        ellipse(i, S, 10, 10);
        point(-i, S);
        ellipse(i, -S, 10, 10);
        point(-i, -S);
      popMatrix();
    popMatrix();




    A+=0.00001*S;
  }
}