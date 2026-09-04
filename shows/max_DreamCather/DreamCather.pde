import netP5.*;
import oscP5.*;

OscP5 O1 ;

DC dc ;

float U1[] ;
int sin = 18 ;       /// number of bands coming in 


void setup(){
  
  //  -----------------basic setup 
  size(600,600,P3D);
  
  surface.setResizable(true);
  // ---------------- class
  dc = new DC() ;  
  
  U1 = new float[sin];
  O1 = new OscP5(this,12346);
  O1.plug(this,"UserOne","/UserOne");
  

}

public void UserOne(float[] s){
  for(int i  = 0 ; i < U1.length; i++){
    U1[i]= s[i]; 
  }
}




void draw(){
    blendMode(BLEND);
  pushMatrix();
  translate(-width*3, -height*3, -3*width);
  fill(0);
  rect(-10, -10, 8*width, 8*height);
  noFill();
  popMatrix();

 float u1lx = U1[0]; 
 float u1ly = U1[1]; 
 float u1lz = U1[2]; 
 float u1rx = U1[3]; 
 float u1ry = U1[4]; 
 float u1rz = U1[5]; 
 
 float u2lx = U1[6]; 
 float u2ly = U1[7]; 
 float u2lz = U1[8]; 
 float u2rx = U1[9]; 
 float u2ry = U1[10]; 
 float u2rz = U1[11];  


  dc.run(u1lx,u1ly,u1lz,u1rx,u1ry,u1rz,u2lx,u2ly,u2lz,u2rx,u2ry,u2rz);
}