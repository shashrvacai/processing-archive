import processing.sound.*;

sPI sp ;
WaveTwo WII ;

Amplitude  amp ;
AudioIn in ;

int state ;
void setup() {
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in. start();
  amp.input(in);
  
  size(1000, 1000);
  background(0);
  state = 0 ;
  
  sp = new sPI();
  WII = new WaveTwo();
}

void draw(){
  float aa =  amp.analyze();
  
  fill(0,50);
  rect(width/2,height/2,width,height);
  noFill();
  
  
  if (state == 0) {
    sp.run(aa);
  } else if (state == 1) {                        
    WII.run(aa);
  } else if (state == 2) {                        
    
  } else if (state ==3) {
   
  }else if (state ==4) {
   
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
  }  else if (key =='4') {
    state = 4 ;
  }else if (key =='q') {
    exit() ;
  }
}