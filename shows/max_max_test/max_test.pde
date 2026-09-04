import netP5.*;
import oscP5.*;

int b = 100;
int sHue = 120 ;
int sin = 18;

float amps[];

OscP5 O ;

void setup(){
  noFill();
  colorMode(HSB);
  ellipseMode(CENTER);
  size(500,500);
  surface.setResizable(true);
  
  amps = new float[sin];
  O = new OscP5(this,1212);
  O.plug(this,"setAmps","/setAmps");
}

public void setAmps(float[] s){
  for(int i  = 0 ; i < amps.length; i++){
    amps[i]= s[i]; 
  }
}

void draw(){
  background(12);
  float t = width/b/2 ;
  
  
  for( int i = 0 ; i < b ; i++ ){
    
    float sinSum = 0.0 ;
    float ph = map(i ,0,b,0,TAU);
    for (int s = 0 ; s< sin ;  ++ s){
      sinSum += sin(ph*(s+1)*amps[s]);
    }
    
    sinSum = map(sinSum,-1,1,0,2);
    sinSum = max(0,sinSum);
    
    stroke(sHue , 220,220,150);
    strokeWeight(t*sinSum);
    float cW = map(i , 0,b , 0 ,width);
    ellipse(width/2, height/2, cW,cW);
  }
}