import processing.sound.*;

Amplitude amp ;
AudioIn in;

Flock  f ;

void setup(){
  amp = new Amplitude(this);
  in  = new AudioIn(this,0);
  in.start();
  amp.input(in); 
  
  
  size(1200,1200);
  f = new Flock();
  for(int i =0 ; i < 200; i++){
    Bird b = new Bird(width/2,height/2);
    f.addBird(b);
  }
}

void draw(){
  float a = amp.analyze()*10;
  fill(255,5);
  pushMatrix();
  translate(width/2,height/2);
  
  rect(0,0,width,height);
  noFill();
  popMatrix();
  
  f.run(a);
  
}

void mouseDragged(){
  f.addBird(new Bird(mouseX, mouseY));
}


// adjustable nDist , map audio to mF ;
