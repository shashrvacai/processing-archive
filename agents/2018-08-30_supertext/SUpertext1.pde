ArrayList<Vehicle> vehicles;
float col = 0 , a = 0 ;
PFont OFont ;

void setup() {
  size(480, 854);
  surface.setResizable(true);
  background(0);
  OFont = createFont("Futura-CondExtraBoldObl", width/6);
  
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 1000; i++) {
    vehicles.add(new Vehicle(random(width), random(height)));     // map mf 
  }
}

void draw() {
  if((mouseX > 0)&&(mouseX<width/4)){
    col =  0 ;
  } else if((mouseX > width/4)&&(mouseX<(width/4)*2)){
    col =  64 ;
  }else if((mouseX > (width/4)*2)&&(mouseX<(width/4)*3)){
    col =  192 ;
  }else {
    col =  255 ;
  }
  
  float C = map(mouseX,0,width-50,255,0);
   float c = map(mouseX,0,width,55,2);
  fill(0, 10);
  rect(0,0,width,height);
  noFill();
  
  
  float sz = map(sin(a),-1, 1, 5,25);
  float sep = map(mouseX, 0, width, sz,2*sz);
  float mF = map(mouseX, 0, width, 0,1);
  
  for(Vehicle v : vehicles){
    v.seperate(vehicles,sz,mF);
    v.update();
    v.borders();
    v.display(col,sz);
    a+= 0.00005 ;
  }
  
  
}

void keyPressed() {
  background(255);
}

void mouseDragged(){
  vehicles.add(new Vehicle(mouseX,mouseY));
}