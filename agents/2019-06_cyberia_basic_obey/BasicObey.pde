
ArrayList<Vehicle> vehicles;   
color BGCol = color(0, 0, 0);
Walker w ;                              // random walker 

void setup() {
// ---------------------------------BASIC SETUP ------------------------------------------------
  size(1920, 1080, P2D);
  surface.setResizable(true);
  background(BGCol);
// ------------------------------------------------------------------------------------------
  
// --------------------------------SERVER SHIT---------------------------------------------

// ------------------------------------------------------------------------------------------
  
  
// ---------------------------------CLASSES ------------------------------------------------
  w = new Walker();

  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 15; i++) {
    vehicles.add(new Vehicle(random(width), random(height),random(50,150)));        // adds one particle in the beginning
  }
  // ---------------------------------------------------------------------------------  
}
float aa = 0.5 ;                            // audio in  MUST HAVE FOR SCRIPT TO START between 0 -1 
float sep = 20;
float mF = 0;
float sz =  20;

void draw() {
  // ---------------------------------SEND TO SERVER ------------------------------------------------  
                           
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
  mF = map(mouseX, 0 ,width , 0 , 5 );
  // ---------------------------------------------------------------------------------  
  // ---------------------------------SEPERATE ------------------------------------------------
  sep = map(mouseX, 0 ,width , 100 , 400 );
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
  vehicles.add(new Vehicle(w.x, w.y, 10));    // adds continuous vehicle
  vehicles.add(new Vehicle(width- w.x, height - w.y, 10));
  }
  if (keyPressed==true) {
    if ( key == 'Q') {                // adds vehicle on key down
      vehicles.add(new Vehicle(w.x, w.y, 10));
    } else if (key == 'p' || key == 'P') {   // resets sketch...
      setup();
    } else if (key == 's' || key == 'S') {   // remove vehs
      if (vehicles.size()>1) {
        vehicles.remove(0);
      } else {
        vehicles.add(new Vehicle(w.x, w.y, 10));
        vehicles.add(new Vehicle(width- w.x, height - w.y, 10));
      }
    }
  }
  // ---------------------------------------------------------------------------------  
   
}
