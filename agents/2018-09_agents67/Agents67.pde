import processing.sound.*;

Amplitude amp ;
AudioIn in ;


ArrayList<veh> V ;

void setup(){
  size(800,800);
  
   background(255);
  amp = new Amplitude(this);
  in = new AudioIn(this,0);
  in.start();
  amp.input(in);
  
  V = new ArrayList<veh>();
  for (int i = 0; i < 100; i++) {
    V.add(new veh(random(width),random(height)));
  }
}

void draw(){
  fill(255,15);
  noStroke();
  rectMode(LEFT);
  rect(0,0,width,height);
  noFill();
  
  
  float aa = amp.analyze();
  
 
  

  for(veh v : V){
    v.seperate(V);
    
    v.run();
    v.update();
    v.show();
    v.edges();
  }
  
}

void mouseDragged() {
  V.add(new veh(mouseX,mouseY));
}