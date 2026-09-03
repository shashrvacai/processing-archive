import processing.sound.*;

Amplitude amp ;
AudioIn in ;

float P ,Q,R ;
float a = 0.0 ;
float aVel = 0.0;
float  aAcc = 0.0 ;

void setup(){
    size(600,600);
    background(0);
    
    amp = new Amplitude(this);
    in = new AudioIn(this,0);
    in.start();
    amp.input(in);
    P = random(width/2-50);
    Q = random(width/2-50);
    R = random(width/2-50);
}

void draw(){
  float Am = amp.analyze()*10;    // amp analyzed
  
   // adding motion trails 
  fill(15,Am*255,255-Am*255,30);
  rectMode(CENTER);
  rect(width/2,height/2,width,height);
  fill(255);
  

  
  
  // calculate the direction of spin
  if (Am > 80){
    aAcc *= -0.5;  
  }else{
    aAcc *=  1; 
  }
  
  a+= aVel ;
  aVel+= aAcc ;
  
  rectMode(CENTER);
    pushMatrix();
  translate(width/2,height/2);
  rotate(Am);
  fill(255,255-255*Am);
  ellipse(0,0,100,25*Am);
    
    
    noFill();
    stroke(255);
    rotate(-Am*2);
    ellipse(Q,0,50,50);
    ellipse(-Q,0,50,50);
    
    
    fill(255,255*Am);
    stroke(255);
    rotate(Am*2);
    ellipse(0,R,50,50);
    ellipse(0,-R,50,50);
    
    noFill();
    stroke(255);
    rotate(Am*2);
    ellipse(-P,P,50,50);
    ellipse(P,-P,50,50);
    
  popMatrix();
}