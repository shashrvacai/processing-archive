Flock  f ;

void setup(){
  size(1200,1200);
  f = new Flock();
  for(int i =0 ; i < 200; i++){
    Bird b = new Bird(width/2,height/2);
    f.addBird(b);
  }
}

void draw(){
  background(255);
  f.run();
}

void mouseDragged(){
  f.addBird(new Bird(mouseX, mouseY));
}


// adjustable nDist , map audio to mF ;