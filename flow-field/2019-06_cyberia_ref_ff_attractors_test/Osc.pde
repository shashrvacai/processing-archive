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

  if (theOscMessage.checkAddrPattern("/cc1")) {   //  message reciever      
    cc1 = v1;
  } else if (theOscMessage.checkAddrPattern("/cc2")) {   //  message reciever      
    cc2 = v2;
  } else if (theOscMessage.checkAddrPattern("/cc3")) {   //  message reciever      
   cc3 = v3;
  } else if (theOscMessage.checkAddrPattern("/cc4")) {   //  message reciever      
    cc4 = v4;
  } else if (theOscMessage.checkAddrPattern("/cc5")) {   //  message reciever      
    cc5 = v5;
  } else if (theOscMessage.checkAddrPattern("/cc6")) {   //  message reciever      
    cc6 = v6;
  } else if (theOscMessage.checkAddrPattern("/cc7")) {   //  message reciever      
    cc7 = v7;
  }  else if (theOscMessage.checkAddrPattern("/cc8")) {   //  message reciever      
    cc8 = v8;
  }else if (theOscMessage.checkAddrPattern("/cc9")) {   //  message reciever      
    cc9 = v9;
  }else if (theOscMessage.checkAddrPattern("/cc10")) {   //  message reciever      
    cc10 = v10;
  } else if (theOscMessage.checkAddrPattern("/cc12")) {   //  message reciever      
    cc12 = v12;
  } else if (theOscMessage.checkAddrPattern("/cc13")) {   //  message reciever      
    cc13 = v13;
  }if (theOscMessage.checkAddrPattern("/cc11")) {   //  message reciever      
    cc11 = v11;
  } else if (theOscMessage.checkAddrPattern("/cc14")) {   //  message reciever      
    cc14 = v14;
  } else if (theOscMessage.checkAddrPattern("/cc15")) {   //  message reciever      
    cc15 = v15;
  } else if (theOscMessage.checkAddrPattern("/cc16")) {   //  message reciever      
    cc16 = v16;
  } else if (theOscMessage.checkAddrPattern("/cc17")) {   //  message reciever      
    cc17 = v17;
  }
} 
