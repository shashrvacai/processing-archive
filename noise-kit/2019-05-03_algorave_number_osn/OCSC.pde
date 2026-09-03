void oscEvent(OscMessage theOscMessage) {       /// osc message to MAX
  float v1 = theOscMessage.get(0).floatValue(); 
  float v2 = theOscMessage.get(0).floatValue(); 
  float v3 = theOscMessage.get(0).floatValue(); 
  float v4 = theOscMessage.get(0).floatValue(); 
  float v5 = theOscMessage.get(0).floatValue(); 
  float v6 = theOscMessage.get(0).floatValue(); 
  float v7 = theOscMessage.get(0).floatValue(); 
  float v8 = theOscMessage.get(0).floatValue(); 
  float v9 = theOscMessage.get(0).floatValue(); 
  float v10 = theOscMessage.get(0).floatValue();  
  float v11 = theOscMessage.get(0).floatValue(); 
  float v12 = theOscMessage.get(0).floatValue(); 
  float v13 = theOscMessage.get(0).floatValue(); 
  float v14 = theOscMessage.get(0).floatValue(); 
  float v15 = theOscMessage.get(0).floatValue(); 
  float v16 = theOscMessage.get(0).floatValue(); 
  float v17 = theOscMessage.get(0).floatValue(); 

  if (theOscMessage.checkAddrPattern("/n1")) {   //  message reciever      
    n1 = v1;
  } else if (theOscMessage.checkAddrPattern("/n2")) {   //  message reciever      
    n2 = v2;
  }
  //} else if (theOscMessage.checkAddrPattern("/n3")) {   //  message reciever      
  //  n3 = v3;
  //} else if (theOscMessage.checkAddrPattern("/n4")) {   //  message reciever      
  //  n4 = v4;
  //} else if (theOscMessage.checkAddrPattern("/n5")) {   //  message reciever      
  //  n5 = v5;
  //} else if (theOscMessage.checkAddrPattern("/n6")) {   //  message reciever      
  //  n6 = v6;
  //} else if (theOscMessage.checkAddrPattern("/n7")) {   //  message reciever      
  //  n7 = v7;
  //}  else if (theOscMessage.checkAddrPattern("/n8")) {   //  message reciever      
  //  n8 = v8;
  //}else if (theOscMessage.checkAddrPattern("/n9")) {   //  message reciever      
  //  n9 = v9;
  //}
} 
