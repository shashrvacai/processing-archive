import processing.sound.*;
Amplitude amp;
AudioIn in;


Star[] stars = new Star[800];
float speed;

void  setup() {
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
  
  size(800,800);
  background(0);
  for (int i = 0; i < stars.length; i++) {
    stars[i]= new Star();
  }  
}

void draw() {
  fill(0,15);
  rect(0,0,width,height);
  noFill();
  float AMP = amp.analyze(); 
  
  speed = map(AMP,-0.05,1,0,20);
  
  translate(width/2,height/2);
  rotate(speed*0.008);
    for (int i= 0; i < stars.length ; i++){
    stars[i].update();
    stars[i].show();
    }
}