import processing.sound.*;

Amplitude amp ;
AudioIn in;

ollie o1,o2 ;

void setup() {
  size(1000, 1000);
  background(0);
  
  amp = new Amplitude(this);
  in  = new AudioIn(this,0);
  in.start();
  amp.input(in); 
 
  o1 = new ollie(20, 20, 1,50, 0.3);  //(int maxC_, float aDist_, float minEllipse_, float maxEllipse_, float fric_)
  o2 = new ollie(10, 30, 1,25, 0.8);
}

void draw () {
  float a = amp.analyze()*10;
  blendMode(BLEND);
  fill(00,55);
  noStroke();
  rect(0,0,width,height);
  noFill();
 
  
   fill(0);
  o1.show(width/2 , height/2,a*1000);
  
  //o2.show(width/3*2 , height/2,a*1000);
}