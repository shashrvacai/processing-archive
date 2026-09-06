import oscP5.*;
import netP5.*;
 
OscP5 oscP5Location2;
NetAddress location2;
 
void setup() {
  size(400, 400);
 
  oscP5Location2 = new OscP5(this, 5001);
  location2 = new NetAddress("127.0.0.1", 6001);
}
 
void draw() {
 
}
 
void mousePressed() {  
  OscMessage myMessage = new OscMessage("/test");
 
  myMessage.add("Location 2: Transmit");
  myMessage.add(mouseX);
 
  oscP5Location2.send(myMessage, location2); 
  println("Sending message.");
}
 
void oscEvent(OscMessage theOscMessage) {  
  String incomingHeader = theOscMessage.get(0).stringValue();
  int incomingMouseX = theOscMessage.get(1).intValue();
 
  // print out the message
  print("OSC Message Received1: ");
  println(incomingHeader + " " + incomingMouseX);
}
