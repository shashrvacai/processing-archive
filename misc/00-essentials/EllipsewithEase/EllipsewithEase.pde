// if possible add times mouse press ... +5 units every mousePress .
import processing.sound.*;

Amplitude amp ;
AudioIn in;

float r , e = 0.05;


void setup(){
size(600,600);
surface.setResizable(true);
  amp = new Amplitude(this);
  in  = new AudioIn(this,0);
  in.start();
  amp.input(in); 
}

void draw(){
  float a = amp.analyze()*10;
  
  background(51);
  float R = map(a,0,1, 10,width/2);
  float Rr = R - r ;
  r += Rr *e ; 
  
  pushMatrix();
  translate(width/2,height/2);
    ellipse(0,0,r,r);
  popMatrix();

}
