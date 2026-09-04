class SP {
    
    float stWt ;
  SP(){
    rectMode(CENTER);
    noiseDetail(2,0.5);
 
  }
  
  void run(float aa_){
    stroke(colo);
    float AA = aa_ *5 ;
    for (int x = 10; x < width; x += 10) {
    for (int y = 10; y < height; y += 10) {
      float n = noise(x * 0.005, y * 0.005, frameCount * 0.05);
      pushMatrix();   
      float recSize = n*AA*10;     
      translate(x, y);
      rotate(TWO_PI *AA*n);
      scale( recSize);
      
        
      
      rect(0, 0, 5, 5);
      popMatrix();
    }
  }
  
  }
}