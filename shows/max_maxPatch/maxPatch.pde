import netP5.*;
import oscP5.*;


int sin = 6 ;

float amps[];

OscP5 O ;

void setup(){
  noFill();

  size(500,500);
  surface.setResizable(true);
  
  amps = new float[sin];
  O = new OscP5(this,12346);
  O.plug(this,"setAmps","/setAmps");
}

public void setAmps(float[] s){
  for(int i  = 0 ; i < amps.length; i++){
    amps[i]= s[i]; 
  }
}

void draw(){
 println(amps[1]);
}