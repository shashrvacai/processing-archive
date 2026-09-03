import processing.sound.*;

ArrayList<Vehicle> vehicles;
float col = 0 ;
PFont OFont ;
Walker w ;
color BGCol = color(0);
color VehCol = color(255);
float aa = 0;

Amplitude  amp ;
AudioIn in ;

void setup() {
  //fullScreen(2);
  size(1000, 1200);
  surface.setResizable(true);
  w = new Walker();
  background(BGCol);

  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);

  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 1; i++) {
    vehicles.add(new Vehicle(random(width), random(height)));    
  }
}

float sep = 20;
float mF = 0;
float sz =  20;

void draw() {
  if(keyPressed == true && key =='7'){
    aa=00;
  }else{
   aa = map(amp.analyze(), 0, 0.5, 0, 1); 
  }
  
  sep = map(aa, 0, 0.5, 20, 160);
  


  fill(BGCol, 10);
  rect(0, 0, width, height);
  noFill();

  if (key == 'q') {
    vehicles.add(new Vehicle(w.x, w.y));    // adds continuous vehicle
  } else if (key == '1' ) {   
    //sep = 20 ;
    mF = 0 ;
  } else if (key == 'e' || key == 'E') {   // emitor .... E 
    if (aa> 0.5) {
      vehicles.add(new Vehicle(w.x, w.y));
    }
  } else if (key == '2' ) {   
    //sep = 30 ;
    mF = 0.25 ;
  } else if (key == '3' ) {   
    //sep = 40 ;
    mF = 0.5 ;
  } else if (key == '4' ) {   
    //sep = 50 ;
    mF = 0.75 ;
  } else if (key == '5' ) {   
    //sep = 60 ;
    mF = 1 ;
  }else if(key == '6'){
     mF =map(aa,0,0.5,0,1);                  // map mf
  }


  for (Vehicle v : vehicles) {
    v.seperate(vehicles, sep, mF);
    v.update();
    v.borders();
    v.display(col, sz);
  }

  if (vehicles.size()>500) {
    vehicles.remove(0);
  }

  w.step();
  //w.render();


  if (keyPressed==true) {
    if ( key == 'Q') {                // adds vehicle on key down
      vehicles.add(new Vehicle(w.x, w.y));
    } else if (key == 'w' || key == 'W') {   // reset switches ...
    } else if (key == 'a' || key == 'A') {   // resets sketch...
      setup();
    } else if (key == 's' || key == 'S') {   // remove vehs
      if (vehicles.size()>1) {
        vehicles.remove(0);
      } else {
        vehicles.add(new Vehicle(w.x, w.y));
      }
    }
  }
}

void mouseDragged() {
}