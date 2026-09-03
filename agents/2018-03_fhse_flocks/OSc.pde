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

  if (theOscMessage.checkAddrPattern("/Fl1")) {   //  message reciever      
    Fl1 = v1;
  } else if (theOscMessage.checkAddrPattern("/Fl2")) {   //  message reciever      
    Fl2 = v2;
  } else if (theOscMessage.checkAddrPattern("/Fl3")) {   //  message reciever      
    Fl3 = v3; 
  }
  //} else if (theOscMessage.checkAddrPattern("/D4")) {   //  message reciever      
  //  D4 = v4;
  //} else if (theOscMessage.checkAddrPattern("/D5")) {   //  message reciever      
  //  D5 = v5;
  //} else if (theOscMessage.checkAddrPattern("/D6")) {   //  message reciever      
  //  D6 = v6;
  //} else if (theOscMessage.checkAddrPattern("/D7")) {   //  message reciever      
  //  D7 = v7;
  //}  else if (theOscMessage.checkAddrPattern("/D8")) {   //  message reciever      
  //  D8 = v8;
  //}else if (theOscMessage.checkAddrPattern("/D9")) {   //  message reciever      
  //  D9 = v9;
  //}
} 
