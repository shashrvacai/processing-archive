import netP5.*;
import oscP5.*;
//import spout.*;

//Spout spout;

PImage img;

int sin = 18;
float HandVal[];
OscP5 O ;

ArrayList<veh> vs;
float  a = 0;
int state = 0 ;

void setup() {
  size(500, 500, OPENGL);
  surface.setResizable(true);
  
  img = loadImage("texture.png");
  
  ////  ----  Sput
  //spout = new Spout(this);
  //spout.createSender("Spout Processingtest");

  /// --- OSC
  HandVal = new float[sin];
  O = new OscP5(this, 12346);
  O.plug(this, "setVal", "/setVal");

  //  --- creating initials vehicles 
  vs = new ArrayList<veh>();
  for (int i = 0; i < 450; i++) {
    vs.add(new veh(random(width), random(height)));
  }
}

public void setVal(float[] s) {
  for (int i  = 0; i < HandVal.length; i++) {
    HandVal[i]= s[i];
  }
}

void draw() {
  //spout.sendTexture();

  noStroke();
  rectMode(LEFT);
  rect(0, 0, width, height);
  noFill();

  float Vx = map(HandVal[0], -1, 1, 0, width) ;     /// attractor  X ;
  float Vy = map(HandVal[1], -1, 1, 0, height) ;   /// attractor Y
  //float Vz = map(HandVal[2], -1, 1, 0, height) ;      // emitter scale
  float Vr = map(HandVal[3], -1, 1, 0, 255) ;     
  float Vg = map(HandVal[4], -1, 1, 0, 255) ;
  float Vb = map(HandVal[5], -1, 1, 0, 255) ;
  //ellipse(Vx, Vy, 10, 10);

  float xu = map(HandVal[6], -1, 1, 0, width) ;      /// emitter X ;
  float yu = map(HandVal[7], -1, 1, 0, height) ;    /// emitter Y ; 
  float zu = map(HandVal[8], -1, 1, 3, 50) ;       // particle size 

  float BGr = map(HandVal[9], -1, 1, 0,255) ;      /// background R ;
  float BGg = map(HandVal[10], -1, 1, 0,255) ;    /// background G  ; 
  float BGb = map(HandVal[11], -1, 1, 0, 255) ;   /// background B  ;
  
  color c = color(BGr,BGg,BGb);

  //vs.add(new veh(map(xu,0,width,2*mouseX,-mouseX),map(yu,0,height,2*mouseY,-mouseY)));
  vs.add(new veh(xu, yu));
  for (int i = vs.size()-1; i >= 0; i--) {
    veh p = vs.get(i);
    p.update();
    if (p.isDead()) {
      vs.remove(i);
    }
  }

  for (veh v : vs) {
    v.aB(vs, Vx, Vy);
    v.update();
    
    if(state == 0){
    v.show1(Vr, Vg, Vb, zu);
    } else if(state ==1){
    v.show2(Vr, Vg, Vb, zu);
    }
    v.edges();
  }
  a+= (0.3) ;
  fill(c);
}

void mouseDragged() {
  vs.add(new veh(mouseX, mouseY));
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
  }  else if (key =='4') {
    state = 4 ;
  }else if (key =='q') {
    exit() ;
  }
   
}