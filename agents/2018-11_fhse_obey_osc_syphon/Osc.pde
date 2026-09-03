void oscEvent(OscMessage theOscMessage) {       /// osc message to MAX
  float v1 = theOscMessage.get(0).floatValue();  
  float v2 = theOscMessage.get(0).floatValue();  
  float v3 = theOscMessage.get(0).floatValue();  

  if (theOscMessage.checkAddrPattern("/o1")) {   //  message reciever      
    o1 = v1;
  } else if (theOscMessage.checkAddrPattern("/o2")) {   //  message reciever      
    o2 = v2;
  } else if (theOscMessage.checkAddrPattern("/o3")) {   //  message reciever      
    o3 = v3;
  }
} 
