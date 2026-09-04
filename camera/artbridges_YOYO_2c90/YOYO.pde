import netP5.*;
import oscP5.*;
import spout.*;

Spout spout;


int sin = 18;
float amps[];
OscP5 O ;

ArrayList<veh> vs;
float  a = 0;


void setup() {
  size(500, 500,OPENGL);
  surface.setResizable(true);
  
   //  ----  Sput
  spout = new Spout(this);
  spout.createSender("Spout Processingtest");

 /// --- OSC
  amps = new float[sin];
  O = new OscP5(this, 12346);
  O.plug(this, "setAmps", "/setAmps");

  //  --- creating initials vehicles 
  vs = new ArrayList<veh>();
  for (int i = 0; i < 450; i++) {
    vs.add(new veh(random(width), random(height)));
  }
}

public void setAmps(float[] s) {
  for (int i  = 0; i < amps.length; i++) {
    amps[i]= s[i];
  }
  
}

void draw() {
    spout.sendTexture();
  
  noStroke();
  rectMode(LEFT);
  rect(0, 0, width, height);
  noFill();

  float x = map(amps[0], -1, 1, 0, width) ;     /// attractor  X ;
  float y = map(amps[1], -1, 1, 0, height) ;      ///  attractor Y

  float a3 = map(amps[3],-1,1,0,255) ;
  float a4 = map(amps[4],-1,1,0,255) ;
  float a5 = map(amps[5],-1,1,0,255) ;

  float a9 = map(amps[9],-1,1,0,255);
   float a10 = map(amps[10],-1,1,0,255);
   float a11 = map(amps[11],-1,1,0,255);
   
   color c = color(a9,a10,155);
  
  //ellipse(x, y, 10, 10);

  float xu = map(amps[6],-1,1,0,width) ;      /// emitter X ;
  float yu = map(amps[8],-1,1,0,height) ;    /// emitter Y ; 

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
    v.aB(vs, x, y);
    v.update();
    v.show(a3,a4,a5);
    v.edges();
  }
  a+= (0.3) ;
fill(c);
}

void mouseDragged() {
  vs.add(new veh(mouseX, mouseY));
}