/// add random walker with flashes  mapped to audio 

//PVector pos, nOff ;

//void setup(){
//  size(600,600);
//  pos = new PVector(width/2,height/2);
//  nOff = new PVector(random(10000),random(1000));
//}

//void draw(){
//  pos.x = map(noise(nOff.x),0,1,0,width);
//  pos.y = map(noise(nOff.y),0,1,0,height);
//  nOff.add(0.01,0.01,0);
//   ellipse(pos.x, pos.y, 48, 48);
//}


import processing.sound.*;
//import spout.*;

float t;

//Spout spout;

Amplitude  amp ;
AudioIn in ;

void setup() {
  //spout = new Spout(this);

  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in. start();
  amp.input(in);
  
  size(600, 1000);
  t=-1200;
}
void draw() {
  float aa =  amp.analyze()*10;
  
  fill(16, 16, 32,20);
  rect(0,0,width,height);
  noFill();
  
  translate(width/2, height/4);
  noStroke();
  fill(255);
   
  
  for (float theta = 0; theta < 6; theta++) {
    for(float j = 1; j < 16; j++){
      for(float i = 0; i < j; i++){
        float x = (i - (j - 1) / 2) *10;
        float y = j * 8.33;
        float d = dist(x, y, 0, 0);
        pushMatrix();
        translate(x, y);
        rotate(radians(d + t) * (j + 16)/24);
        ellipse(x, y, 5, 5);
        popMatrix();
      }
    }
    rotate(PI / 3);
  }
  t+= aa;
}
