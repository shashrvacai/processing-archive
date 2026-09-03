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

  if (theOscMessage.checkAddrPattern("/daCh1")) {   //  message reciever      
    daCh1 = v1;
  } else if (theOscMessage.checkAddrPattern("/daCh2")) {   //  message reciever      
    daCh2 = v2;
  } else if (theOscMessage.checkAddrPattern("/daCh3")) {   //  message reciever      
    daCh3 = v3;
  } else if (theOscMessage.checkAddrPattern("/daCh4")) {   //  message reciever      
    daCh4 = v4;
  } else if (theOscMessage.checkAddrPattern("/daCh5")) {   //  message reciever      
    daCh5 = v5;
  } else if (theOscMessage.checkAddrPattern("/rDD6")) {   //  message reciever      
    daCh6 = v6;
  //}else if  (theOscMessage.checkAddrPattern("/rDD7")) {      
  //  rDD7 = v7;
  //} else if (theOscMessage.checkAddrPattern("/rDD8")) {   //  message reciever      
  //  rDD8= v8;
  //} else if (theOscMessage.checkAddrPattern("/rDD9")) {   //  message reciever      
  //  rDD9 = v9;
  //} else if (theOscMessage.checkAddrPattern("/rDD10")) {   //  message reciever      
  //  rDD10 = v10;
  //} else if (theOscMessage.checkAddrPattern("/rDD11")) {   //  message reciever      
  //  rDD11 = v11;
  //} else if (theOscMessage.checkAddrPattern("/rDD12")) {   //  message reciever      
  //  rDD12 = v12;
  //} else if (theOscMessage.checkAddrPattern("/rDD13")) {   //  message reciever      
  //  rDD13 = v13;
  //} else if (theOscMessage.checkAddrPattern("/rDD14")) {   //  message reciever      
  //  rDD14 = v14;
  //} else if (theOscMessage.checkAddrPattern("/rDD15")) {   //  message reciever      
  //  rDD15 = v15;
  } 
} 
