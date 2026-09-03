ArrayList<Vehicle> vehicles;
float col = 0 ;
PFont OFont ;

void setup() {
  size(1080, 1920);
  background(0);
  OFont = createFont("Futura-CondExtraBoldObl", width/6);
  
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 500; i++) {
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
  fill(255, 10);
  rect(0,0,width,height);
  noFill();
  
   fill(0,C);
  textAlign(CENTER);
  textSize(width/6);
  textFont(OFont);
 //text("OBEY", width/3+100, height/3);
  
 
  
 
  
  float sz = map(mouseX, 0, width, 5,20);
  float sep = map(mouseX, 0, width, 20,70);
  float mF = map(mouseX, 0, width, 0,1);
  
  for(Vehicle v : vehicles){
    v.seperate(vehicles,sep,mF);
    v.update();
    v.borders();
    v.display(col,sz);
  }
}

void keyPressed() {
  background(255);
}

void mouseDragged(){
  vehicles.add(new Vehicle(mouseX,mouseY));
}
