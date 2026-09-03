/* NEED TO 
 -connect to the x midi 
 - add buttons for add particle and remove particles 
 */

/* DONE 
 - connect to max patch(obey.pat)
 -control Q - add , S , 
 -sound mapping 
 */
import codeanticode.syphon.*;
import java.util.Locale;
import oscP5.*;
OscP5 oscP5;

SyphonServer server;
float o1 =  0.0, o2  = 0.0, o3 = 1  ; 
import processing.sound.*;

ArrayList<Vehicle> vehicles;
float col = 0 ;
PFont OFont ;
Walker w ;
color BGCol = color(0);
color VehCol = color(255);
float aa = 20;

Amplitude  amp ;
AudioIn in ;

void setup() {
  oscP5 = new OscP5(this, 12000);                            // OSc sending   
  server = new SyphonServer(this, "Obey");      // syphon server


  size(1000, 1200, P2D);
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
  server.sendScreen();                                 //     send screen

  if (keyPressed == true && key =='7') {
    aa=00;
  } else {
    aa = map(amp.analyze(), 0, 0.3, 0, 1);
  }
  
  

  sz = o3 ;
  sep = o2;

  fill(BGCol, 10);
  rect(0, 0, width, height);
  noFill();

  if (key == 'q') {
    vehicles.add(new Vehicle(w.x, w.y));    // adds continuous vehicle
    vehicles.add(new Vehicle(width- w.x, height - w.y));
  } else if (key == '1' ) {   
    mF = 0 ;
  } else if (key == '2' ) {   
    mF = o2 ;
  } else if (key == '3' ) {   
    sep = o2 ;
    mF = o1 ;
  } else if (key == 'e' || key == 'E') {   // emitor .... E 
    if (aa> 0.5) {
      vehicles.add(new Vehicle(w.x, w.y));
    }
  } 

  for (Vehicle v : vehicles) {
    v.seperate(vehicles, sep, mF, aa);
    v.update();
    v.borders();
    v.display(col, sz);
  }

  if (vehicles.size()>500) {
    vehicles.remove(0);
  }

  w.step();


  if (keyPressed==true) {
    if ( key == 'Q') {                // adds vehicle on key down
      vehicles.add(new Vehicle(w.x, w.y));
    } else if (key == 'p' || key == 'P') {   // resets sketch...
      setup();
    } else if (key == 's' || key == 'S') {   // remove vehs
      if (vehicles.size()>1) {
        vehicles.remove(0);
      } else {
        vehicles.add(new Vehicle(w.x, w.y));
        vehicles.add(new Vehicle(width- w.x, height - w.y));
      }
    }
  }
}

void mouseDragged() {
}
