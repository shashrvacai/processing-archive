import oscP5.*;
import netP5.*;
 
OscP5 oscP5Location1;
NetAddress location1;
 
void setup() {
  size(400, 400);
 
  oscP5Location1 = new OscP5(this, 6001);
  location1 = new NetAddress("127.0.0.1", 5001);
}
 
void draw() {
 
}
 
void mousePressed() {  
  OscMessage myMessage = new OscMessage("/test");
 
  myMessage.add("Location 1: Transmit");
  myMessage.add(mouseX);
 
  oscP5Location1.send(myMessage, location1); 
  println("Sending message.");
}
 
void oscEvent(OscMessage theOscMessage) {  
  String incomingHeader = theOscMessage.get(0).stringValue();
  int incomingMouseX = theOscMessage.get(1).intValue();
 
  // print out the message
  print("OSC Message Received2: ");
  println(incomingHeader + " " + incomingMouseX);
}
