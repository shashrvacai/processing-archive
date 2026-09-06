import codeanticode.syphon.*;
import java.util.Locale;
import oscP5.*;
OscP5 oscP5;

SyphonServer server;

float s1 =  0 ; 

void setup(){
  size(600,600,P2D);
  oscP5 = new OscP5(this, 12000);    
  server = new SyphonServer(this, "Processing Syphon");      // syphon server
}

void draw(){
  background(0);
  fill(0,0,255);
  ellipse(width/2, height/2 , map(s1,0,127,0,width) ,map(s1,0,127,0,width));
  server.sendScreen();
}

void oscEvent(OscMessage theOscMessage) {       /// osc message to MAX
  float v1 = theOscMessage.get(0).floatValue();  

  if (theOscMessage.checkAddrPattern("/s1")) {   //  message reciever      
    s1 = v1;
  } 
} 
