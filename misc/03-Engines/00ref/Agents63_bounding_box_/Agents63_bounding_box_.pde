
veh v ;

boolean debug = true ;
float d = 125 ;

void setup() {
  size(700, 700);
  background(255);
  v= new veh(width/2, height/2);
}

void draw() {
  fill(255,5);
  noStroke();
  rectMode(LEFT);
  rect(0,0,width,height);
  noFill();
    
  v.bound();
  v.run();
}

void mousePressed(){
  debug =  !debug;
}