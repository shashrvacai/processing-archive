import processing.sound.*;
//import spout.*;

eS_TWO es ;
sPI sp ;
WaveTwo WII ;
moora m ;

//Spout spout;

Amplitude  amp ;
AudioIn in ;

int state ;
void setup() {
  //spout = new Spout(this);

  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in. start();
  amp.input(in);


  size(800, 800, P3D);
  //fullScreen(2);
  background(0);
  state = 0 ;


  m = new moora();
  sp = new sPI();
  WII = new WaveTwo();
  es = new eS_TWO();
}

void draw() {
  float aa =  amp.analyze();

  //spout.sendTexture();
  noStroke();
  fill(0, 25);
  rect(width/2, height/2, width, height);
  noFill();


  if (state == 0) {      ///   ------->SImple PI
    fill(0);
    rect(width/2, height/2, width, height);
    noFill();
    sp.run(aa);


  } else if (state == 1) {  



    WII.run(aa);

 
  } else if (state == 2) {             
    fill(0);
    rect(width/2, height/2, width, height);
    noFill();
    es.run(aa);      // --------->echo sound
    
 
    
  } else if (state ==3) {
    fill(0);
    rect(width/2, height/2, width, height);
    noFill();
    m.run(aa);
    
  
    
  } else if (state ==4) {
    background(0);
  }
}



void keyTyped() {
  if (key =='0') {  
    state = 0 ;
  } else if (key =='1') {
    state = 1 ;
  } else if (key =='2') {
    state = 2 ;
  } else if (key =='3') {
    state = 3 ;
  } else if (key =='4') {
    state = 4 ;
  } else if (key =='q') {
    exit() ;
  }
}