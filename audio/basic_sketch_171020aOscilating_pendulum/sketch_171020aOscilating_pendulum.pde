import processing.sound.*;

Amplitude amp ;
AudioIn in ;

bob b1,b2,b3,b4,b5,b6,b7,b8,b9,b10 ;


void setup(){
    size(600,600);
    background(0);
    
    amp = new Amplitude(this);
    in = new AudioIn(this,0);
    in.start();
    amp.input(in);
     
    b1 = new bob(new PVector(0,0),15);
    b2 = new bob(new PVector(0,0),25);
    b3 = new bob(new PVector(0,0),35);
    b4 = new bob(new PVector(0,0),45);
    b5 = new bob(new PVector(0,0),55);
    b6 = new bob(new PVector(0,0),65);
    b7 = new bob(new PVector(0,0),75);
    b8 = new bob(new PVector(0,0),85);
    b9 = new bob(new PVector(0,0),95);
    b10 = new bob(new PVector(0,0),105);
    
}

void draw(){
   fill(0,15);
   rect(0,0,width,height);
   noFill();
  
  
  float Am = amp.analyze()*5;
  scale(2);
  translate(width/4,height/4);
  
  b1.update(Am);
  b1.show();
  
  b2.update(Am);
  b2.show();
  
  b3.update(Am);
  b3.show();
  
  b4.update(Am);
  b4.show();
  
  b5.update(Am);
  b5.show();
  
  b6.update(Am);
  b6.show();
  
  b7.update(Am);
  b7.show();
  
  b8.update(Am);
  b8.show();
  
  b9.update(Am);
  b9.show();
  
  b10.update(Am);
  b10.show();
  
  

}