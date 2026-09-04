import processing.sound.*;
//import netP5.*;
//import oscP5.*;
import spout.*;

Amplitude amp;
AudioIn in ;

Spout spout;

int sin = 18;
float amps[];
//OscP5 O ;


ArrayList<Vehicle> vehicles;
DC dc ;
PVector pos, nOff ;
float  r, sep = 20, mF = 0, sz =  20, col = 0 ;

int state ;
color BGCol = color(0), VehCol = color(255);  

void setup() {
  // ---  OSc   
  amps = new float[sin];
  //O = new OscP5(this, 12346);
  //O.plug(this, "setAmps", "/setAmps");

  ////  ----  Sput
  spout = new Spout(this);
  spout.createSender("Spout Processingtest");
 
  
  //------------------------------------- Audio in 

  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);

  //------------------------------------- setup

  //fullScreen(OPENGL,2);           /// ------ screen number .
  size(1000, 1000, OPENGL);
  background(BGCol);
  noFill();

  // ----------------------------------- objects
  dc = new DC();

  //------------------------------------ variables
  state= 0 ;
  pos = new PVector(width/2, height/2);
  nOff = new PVector(random(10000), random(1000));

  // ----------------------------------vehicle (Obey)
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 1; i++) {
    vehicles.add(new Vehicle(random(width), random(height)));
  }
}

void draw() {
  spout.sendTexture();
  
  float aa = amp.analyze();
  

  if (keyPressed == true && key =='m') {
    aa=00;
  } else {
    aa = map(amp.analyze(), 0, 0.5, 0, 1);
  }
  sep = map(aa, 0, 0.5, 20, 160);

  // --------------------------BLUR  
  //blendMode(BLEND);
  noStroke(); 
  fill(0,5);
  rect(0, 0, 8*width, 8*height);
  noFill();


  // --------------------- random Circles
  

  if (state == 0) {                        //--- DreamCatcher - 0 
    
    dc.run(aa);
  } else if (state == 1) {  
    //blendMode(BLEND);
    vehicles.add(new Vehicle(pos.x, pos.y)); //  ------------- obey
    for (Vehicle v : vehicles) {
      v.seperate(vehicles, sep, mF);
      v.update();
      v.borders();
      v.display(col, sz);
    }
    if (vehicles.size()>500) {
      vehicles.remove(0);
    }
  } 


  if (key == 'q') {
    vehicles.add(new Vehicle(pos.x, pos.y));    // adds continuous vehicle
  } else if (key == ']' ) {   
    //sep = 20 ;
    mF = 0 ;
  } else if (key == '[' ) {   
    //sep = 30 ;
    mF = 0.25 ;
  } else if (key == 'p' ) {   
    //sep = 40 ;
    mF = 0.5 ;
  } else if (key == 'o' ) {   
    //sep = 50 ;
    mF = 0.75 ;
  } else if (key == 'i' ) {   
    //sep = 60 ;
    mF = 1 ;
  } else if (key == 'u') {
    mF =map(aa, 0, 0.5, 0, 1);
  }             
  
   r = random(400);
  pos.x = map(noise(nOff.x), 0, 1, 0, width);
  pos.y = map(noise(nOff.y), 0, 1, 0, height);
  nOff.add(aa/10, aa/10, 0);

  if (keyPressed== true && key == '5') {
    blendMode(DIFFERENCE);
    fill(0);
    ellipse(width-pos.x, height-pos.y, r, r);
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
  }
  else if (key =='Q') {
    vehicles.add(new Vehicle(pos.x, pos.y));
  }
}