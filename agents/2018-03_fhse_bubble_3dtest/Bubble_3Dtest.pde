import peasy.*;
PeasyCam cam;

import processing.sound.*;

FF f ;
ArrayList<Veh> v ;

Amplitude  amp ;
AudioIn in ;

void setup() {
  cam = new PeasyCam(this, 400);
  //fullScreen(1);
  size(1700,700,P3D);
  surface.setResizable(true);
  background(0);

  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);

  f = new FF(10); 
  v = new ArrayList<Veh>();
  
  for (int i = 0; i < 1200; i++) {
    v.add(new Veh(new PVector(random(width), random(height-height/3,height)), random(2, 5), random(0.1, 0.5)));
  }
}

float aa = 0.5 ;

void draw() {
  background(0);
  rotateX(-.5f);
  rotateY(-.5f);
  lights();
  scale(10);
  
  
  if(keyPressed == true && key =='7'){
    aa=00;
  }else{
   aa = map(amp.analyze(),0,1,0,200);
  }
  
  if(aa > 25 ){    //       <-------------- -------------grid sensivit
    f.init(int(random(100,500)),aa);
  }
  int uu = int(random(10, 500));

  noStroke();
  fill(0, 10);
  //rect(width/2, height/2, width, height);
  noFill();

  for (Veh veh : v) {
    veh.follow(f);
    veh.run(aa);
  }
  if (keyPressed==true) {
    if ( key == 'Q') {                // adds vehicle on key down
      v.add(new Veh(new PVector(random(width), (height)), random(2, 5), random(0.1, 0.5)));
    } else if (key == 'w' || key == 'W') { 
      f.init(int(random(50,500)),aa);                                        // reset FF 
    } else if (key == 's' || key == 'S') {   // remove vehs
      if (v.size()>1) {
        v.remove(0);
      } else {
        v.add(new Veh(new PVector(random(width), (height)), random(2, 5), random(0.1, 0.5)));
      }
    }
  }
}
