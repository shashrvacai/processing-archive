import codeanticode.syphon.*;
import java.util.Locale;
import oscP5.*;
OscP5 oscP5;

SyphonServer server;
float o1 =  0.0, o2  = 0.0, o3 = 1 , o4  = 0.0, o5 = 1   ; 

ArrayList<Vehicle> vehicles;   
color BGCol = color(0, 0, 0);
Walker w ;                              // random walker 

void setup() {
// ---------------------------------BASIC SETUP ------------------------------------------------
  size(1000, 1200, P2D);
  surface.setResizable(true);
  background(BGCol);
  frameRate(33);
// ------------------------------------------------------------------------------------------
  
// --------------------------------SERVER SHIT---------------------------------------------
  oscP5 = new OscP5(this, 12000);                            // OSc sending   
  server = new SyphonServer(this, "Obey");      // syphon server
// ------------------------------------------------------------------------------------------
  
  
// ---------------------------------CLASSES ------------------------------------------------
  w = new Walker();

  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 1; i++) {
    vehicles.add(new Vehicle(random(width), random(height)));        // adds one particle in the beginning
  }
  // ---------------------------------------------------------------------------------  
}
float aa = 0.5 ;                            // audio in  MUST HAVE FOR SCRIPT TO START between 0 -1 
float sep = 20;
float mF = 0;
float sz =  20;

void draw() {
  // ---------------------------------SEND TO SERVER ------------------------------------------------  
   server.sendScreen();                                
  // ---------------------------------------------------------------------------------  
  // ---------------------------------trail ------------------------------------------------
  fill(BGCol, 10);
  rect(0, 0, width, height);
  noFill();
  // ---------------------------------------------------------------------------------
  // ---------------------------------WALKER POSITION------------------------------------------------
  //PVector w = new PVector(mouseX,mouseY);               --------------- PVector if mouse val
  w.step();
  // ---------------------------------------------------------------------------------  
  // ---------------------------------MAX FORCE------------------------------------------------
  //mF = map(mouseX, 0 ,width , 0 , 5 );
  mF = o1 ;
  // ---------------------------------------------------------------------------------  
  // ---------------------------------SEPERATE ------------------------------------------------
  //sep = map(mouseX, 0 ,width , 10 , 100 );
  sep = o2 ;
  // --------------------------------------------------------------------------------- 
    // ---------------------------------SIZE ------------------------------------------------
  //sz = map(mouseX, 0 ,width , 10 , 30 );
  sz = o3 ;
  // --------------------------------------------------------------------------------- 
    // ---------------------------------AUDIO IN TO START MOTION ------------------------------------------------
  //aa = map(mouseX, 0 ,width , 0 , 1 );
  aa = o4 ;
  // --------------------------------------------------------------------------------- 
  // ---------------------------------VEHICLE START------------------------------------------------
  for (Vehicle v : vehicles) {
    v.seperate(vehicles, sep, mF);
    v.update();
    v.borders();
    v.display( sz);
  }

  if (vehicles.size()>500) {
    vehicles.remove(0);
  }
  // ---------------------------------------------------------------------------------  
  // ---------------------------------KEY --- CONTROL ------------------------------------------------
   if (key == 'q') {
  vehicles.add(new Vehicle(w.x, w.y));    // adds continuous vehicle
  vehicles.add(new Vehicle(width- w.x, height - w.y));
  }
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
  // ---------------------------------------------------------------------------------  
   
}
