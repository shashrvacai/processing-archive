import processing.sound.*;

Amplitude amp ;
AudioIn in;

float r = 150 ;
float a = 0 ;
float aA = 0 ;
float red = 0.22;
float div = 0.1 ;

void setup(){
  size(1200,1200);
  background(0);
  
  amp = new Amplitude(this);
  in  = new AudioIn(this,0);
  in.start();
  amp.input(in); 

}

void draw(){
   aA = amp.analyze()*5;
  translate(width/2, height/2);
  //rotate(a);
  fill(255);
  noStroke();
  
  div = map(sin(aA),-1,1,1,0.5);
  
  float x = (r/div) *sin(a);
  float y =( r/red*div)  *cos(a);
  
  
  ellipse(x,y,2,2);
  red +=0.001;
  //aA+= 0.5;
 a+= aA/10;
}
