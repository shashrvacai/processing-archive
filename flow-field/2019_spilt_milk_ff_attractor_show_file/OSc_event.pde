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

  if (theOscMessage.checkAddrPattern("/s1")) {   //  message reciever      
    s1 = v1;
  } else if (theOscMessage.checkAddrPattern("/s2")) {   //  message reciever      
    s2 = v2;
  } else if (theOscMessage.checkAddrPattern("/s3")) {   //  message reciever      
    s3 = v3;
  } else if (theOscMessage.checkAddrPattern("/s4")) {   //  message reciever      
    s4 = v4;
  } else if (theOscMessage.checkAddrPattern("/s5")) {   //  message reciever      
    s5 = v5;
  } else if (theOscMessage.checkAddrPattern("/s6")) {   //  message reciever      
    s6 = v6;
  } else if (theOscMessage.checkAddrPattern("/s7")) {   //  message reciever      
    s7 = v7;
  }  else if (theOscMessage.checkAddrPattern("/s8")) {   //  message reciever      
    s8 = v8;
  }else if (theOscMessage.checkAddrPattern("/s9")) {   //  message reciever      
    s9 = v9;
  }else if (theOscMessage.checkAddrPattern("/s10")) {   //  message reciever      
    s10 = v10;
  } else if (theOscMessage.checkAddrPattern("/s12")) {   //  message reciever      
    s12 = v12;
  } else if (theOscMessage.checkAddrPattern("/s13")) {   //  message reciever      
    s13 = v13;
  }if (theOscMessage.checkAddrPattern("/s11")) {   //  message reciever      
    s11 = v11;
  } else if (theOscMessage.checkAddrPattern("/s14")) {   //  message reciever      
    s14 = v14;
  } else if (theOscMessage.checkAddrPattern("/s15")) {   //  message reciever      
    s15 = v15;
  } else if (theOscMessage.checkAddrPattern("/s16")) {   //  message reciever      
    s16 = v16;
  } else if (theOscMessage.checkAddrPattern("/s17")) {   //  message reciever      
    s17 = v17;
  }
} 
