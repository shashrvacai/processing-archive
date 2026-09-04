import org.openkinect.processing.*;

Kinect2 K ;   // k in the kinect object

void setup(){
  size(1536,1272);
  surface.setResizable(true);
  K = new Kinect2(this);
  
  K.initDepth();  // int depth ; 
  K.initDevice();
}

void draw(){
  scale(3);
  background(255);
  
  PImage dep =  K.getDepthImage();  // depth img
  //image(dep,0,0);   // test depth image
  int[]  Rdep = K.getRawDepth();
  
  
  int s = 2;    // skip
  for(int x = 0 ; x < dep.width ; x+=s){
      for(int y = 0 ; y < dep.height ; y+=s){
        int  i = x + y* dep.width;    // index 
        float b = brightness(dep.pixels[i]);  
        int d = Rdep[i];   // depth index
        float n = map(d , 175,1050, 0,255);
        float si = map(n,0,255,0.1,5);
        
        float m = map(b , 0,255,8,50); // mapping brightness values 
        
       if(d <1050 && d >175){
        fill(n,0,255-n,n);
        //noStroke();
          strokeWeight(0.5);
          stroke(0,n); 
          ellipse(x,y, si ,si);
      }else{
        fill(0);
        //rect(x,y, m, m); 
      }   
       
      }
  }
}