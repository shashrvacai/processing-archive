import netP5.*;
import oscP5.*;

OscP5 max ;

int l = 200 ;
float i_ = 0 ;

void setup(){
  size(600,600);
  surface.setResizable(true);
  stroke(255);
  noSmooth();
  background(0);
  max = new OscP5(this, 6002);
  max.plug(this,"setAmp","/amp");
  
}

public void setAmp(float amp_){
  i_ = amp_*10;
}

void draw(){
  
  fill(0,55);
  rect(0,0,width, height);
  //i_=((float)mouseX/width)*10;
  


  float ax = width/2 ;
  
  float ay = height/2 ;
  for (int i = 0 ; i < l ; i++){
    float bx = ax + random(-i_,i_);
    float by = ay + random(-i_,i_);
    line(ax,ay,bx,by );
    ax= bx ;
    ay = by;
  }
}