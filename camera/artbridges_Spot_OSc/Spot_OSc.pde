import netP5.*;
import oscP5.*;
//import spout.*;

//Spout spout;


int sin = 18;
float amps[];
OscP5 O ;

void setup(){
  frameRate(30);
  size(500,500,OPENGL);
  
  // ---  OSc   
    amps = new float[sin];
  O = new OscP5(this, 12346);
  O.plug(this, "setAmps", "/setAmps");
  
  ////  ----  Sput
  //spout = new Spout(this);
  //spout.createSender("Spout Processingtest");

}

public void setAmps(float[] s) {
  for (int i  = 0; i < amps.length; i++) {
    amps[i]= s[i];
  } 
}

void draw(){
   //spout.sendTexture();
  background(0);
  
    float x = map(amps[0],1,-1,0,width); 
    float y = map(amps[1],1,-1,0,height); 
    float z = map(amps[3],1,-1,20,180); 
    
    fill(255,0,0);
    ellipse(x,y,z,z);

}