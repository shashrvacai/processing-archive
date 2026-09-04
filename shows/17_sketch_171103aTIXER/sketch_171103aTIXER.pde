import processing.sound.*;
Amplitude amp;
AudioIn in ;

Recta re ;
Perlin p ;
Snooker s ;
DreamCatcher d ;

int state ;

void setup() {
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);


  size(1200, 1200, P3D);
  state= 0 ;

  re = new Recta();
  d= new DreamCatcher();
  s = new Snooker();
  p  = new Perlin();
}

void draw() {
  if (state == 0) {
    p.run();
  } else if (state == 1) {
    s.run();
  } else if (state == 2) {
    d.run();
  } else if (state ==4) {
    re.run();
  }

  if (keyPressed && key == 't' || key == 'T') {
    if (state == 1) {
      //translate(-width/2, -height/2);
      scale(0.5);
      noStroke();
      rotate(-PI/2);
      fill(0, 50);
      //rect(0,0,width,height);
      noFill();
      blendMode(ADD);
      re.run();
    }else if (state == 2) {  
      noStroke();
      fill(0, 50);
     //rect(0,0,width,height);
      blendMode(ADD);
      re.run();
      blendMode(BLEND);
    }else if (state == 0) {  
      noStroke();
      fill(0, 50);
       rect(0,0,width,height);
      blendMode(ADD);
      re.run();
      blendMode(BLEND);
    }

    
  } else {
    blendMode(BLEND);
  }
}



void keyTyped() {
  if (key =='0') {  
    state = 0 ;
  } else if (key =='1') {
    state = 1 ;
  } else if (key =='2') {
    state = 2 ;
  } else if (key =='4') {
    state = 4 ;
  }
}