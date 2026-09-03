import processing.sound.*;

Amplitude amp ;
AudioIn in ;

Bob[] bs = new Bob[15] ;
float Br = 30 ;
float u = -1 ;
float inc = 10 ;


void setup(){
  
  amp = new Amplitude(this);
  in =  new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
  size(600,600);
  background(0);
  
  for (int i =0 ; i< bs.length ; i++){
     bs[i] = new Bob(new PVector(width/2,0), 10+(i*Br) , Br);
  }
}


void draw(){
  fill(0,10);
  rect(0,0,width,height);
  noFill();
  translate(0,height/2);
  float Am = amp.analyze()*inc;
  //println(Am);
  
   if (Am > inc) {
    u *= -1;
  } else {
    u *=  1;
  }
  
  
  
  
  noStroke();
  fill(250);
  
  for (int i =0 ; i< bs.length ; i++){
     //bs[i].applyForce(Am);
     bs[i].show();
     bs[i].update(Am,u);
  }
  
}