import processing.sound.*;

Amplitude amp;
AudioIn in ;

color colo ;
int cc = 1 ;

DC dc ;
Curtain c ;
Sust s ;
SP sp ;

int state ;

void setup() {
  //------------------------------------- Audio in 

  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);

  //------------------------------------- setup
  
  //fullScreen(OPENGL,2);           /// ------ screen number .
  size(1920, 1080, OPENGL);
  background(10);
  noFill();

  // ----------------------------------- objects
  dc = new DC();
  c = new Curtain();
  s = new Sust();
  sp = new SP();

  //------------------------------------ variables
  state= 0 ;
}

void draw() {

  float aa = amp.analyze();

  // --------------------------BLUR  
  blendMode(BLEND);
  pushMatrix();
  translate(width/2, height/2, -3*width);
  fill(0);
  rect(0, 0, 8*width, 8*height);
  noFill();
  popMatrix();

  if(cc == 1){
    colo = color(225,10,13);
  }else if(cc == 2){
    colo = color(10,242,30);
  }else if(cc == 3){
    colo = color(10,14,230);
  }


  if (state == 0) {                        //--- DreamCatcher - 0 
    dc.run(aa);
  } else if (state == 1) {                        //--- Curtain - 1 
    pushMatrix();    
    c.run();
    popMatrix();
  } else if (state == 2) {                        //--- DreamCatcher - Sust 
    translate(0, height*2-600);
    rotate(-PI/2);
    s.run(aa);
  } else if (state ==4) {
    pushMatrix();
    sp.run(aa);
    popMatrix();
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
   else if (key =='r') {
    cc = 1 ;
  }  else if (key =='g') {
    cc = 2 ;
  }else if (key =='b') {
    cc = 3;
  }
}
