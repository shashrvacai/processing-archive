import processing.sound.*;
//import spout.*;

Amplitude amp;
AudioIn in ;

//Spout spout;

ArrayList<star> starArray = new ArrayList<star>();
ArrayList<Vehicle> vehicles; 

DC dc ;
star neuerStern;

PVector pos, nOff, starcontrol;
float  r, sep = 20, mF = 0, sz =  20, col = 0 ;

int state, numberOfStars = 2000, newStars =20;
color BGCol = color(0), VehCol = color(255);  

void setup() {
  ////  ----  Spout
  //spout = new Spout(this);
  //spout.createSender("Spout Processingtest");

  //------------------------------------- Audio in 
  amp = new Amplitude(this);  
  in = new AudioIn(this, 0);
  in.start();  
  amp.input(in);

  //------------------------------------- setup
  //fullScreen(OPENGL,2);           /// ------ screen number .
  size(1000, 1000, OPENGL);
  background(BGCol);
  noiseDetail(2, 0.5);

  // ----------------------------------- objects
  dc = new DC();
  neuerStern= new star();

  //------------------------------------ variables
  state= 0 ;
  pos = new PVector(width/2, height/2);
  nOff = new PVector(random(10000), random(1000));
    starcontrol = new PVector(width/2, height/2);
  

  // ----------------------------------vehicle (Obey)
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 1; i++) {
    vehicles.add(new Vehicle(random(width), random(height)));
  }


}

void draw() {
  //spout.sendTexture();

  float aa = 0.5;//amp.analyze();

  if (keyPressed == true && key =='m') aa=00;
  else  aa = 0.5;//map(amp.analyze(), 0, 0.5, 0, 1);

  sep = map(aa, 0, 0.5, 20, 160);

  // --------------------------BLUR  
  //blendMode(BLEND);
  noStroke(); 
  fill(0, 5);
  rect(0, 0, 8*width, 8*height);
  noFill();

  // --------------------- random Circles

  if (state == 0) {                        //--- DreamCatcher - 0 
    dc.run(aa);
  } else if (state == 1) {           //  --------  Obey --1
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
  } else if (state == 2) {    /// -- noise wall   ------------ 2
    rectMode(CENTER);
    stroke(200);
    for (int x = 10; x < width; x += 10) {
      for (int y = 10; y < height; y += 10) {
        float n = noise(x * 0.005, y * 0.005, frameCount * 0.05);
        pushMatrix();   
        float recSize = n*aa*10;     
        translate(x, y);
        rotate(TWO_PI *aa*n);
        scale( recSize);
        rect(0, 0, 5, 5);
        popMatrix();
      }
    }
  } else if (state == 3) {      // ---  star feild        ----3 
    fill(255);
    neuerStern.render();
    for (int i = 0; i<newStars; i++) {   // star init
      starArray.add(new star());
    }
    for (int i = 0; i<starArray.size(); i++) {
      if (starArray.get(i).x<0||starArray.get(i).x>width||starArray.get(i).y<0||starArray.get(i).y>height) starArray.remove(i);
      starArray.get(i).move(aa);
      starArray.get(i).render();
    }
    if (starArray.size()>numberOfStars) {//
      for (int i = 0; i<newStars; i++) {
        starArray.remove(i);
      }
    }
  }


  if (key == 'q')     vehicles.add(new Vehicle(pos.x, pos.y));    // adds continuous vehicle
  else if (key == ']' ) mF = 0 ;       //sep = 20 ;    
  else if (key == '[' )  mF = 0.25;       //sep = 30 ;     
  else if (key == 'p' )  mF = 0.5 ;       //sep = 40 ;  
  else if (key == 'o' )  mF = 0.75 ;       //sep = 50 ;  
  else if (key == 'i' )  mF = 1 ;       //sep = 60 ;
  else if (key == 'u')   mF =map(aa, 0, 0.5, 0, 1);    

  if (key == 'r')    starcontrol = new PVector(0, 0);
  else if (key == 't')    starcontrol = new PVector(width/2, 0);
  else if (key == 'y')    starcontrol = new PVector(0, width);
  else if (key == 'h')    starcontrol = new PVector(width, height/2);
  else if (key == 'n')    starcontrol = new PVector(width, height);
  else if (key == 'b')    starcontrol = new PVector(width/2, height);
  else if (key == 'v')    starcontrol = new PVector(0, height);
  else if (key == 'f')    starcontrol = new PVector(0, height/2);
  else if (key == 'g')    starcontrol = new PVector(width/2, height/2);

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
  if (key =='0')           state = 0 ;
  else if (key =='1')      state = 1 ;
  else if (key =='2')      state = 2 ;
  else if (key =='3')      state = 3 ;
  else if (key =='4')      state = 4 ;
}
