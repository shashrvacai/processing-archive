import processing.video.*;

Capture v ;

void setup() {
  size(1280, 720);
  v = new Capture(this,1280, 720);
  v.start();
}

void captureEvent(Capture v) {
  v.read();
}

void draw() {
  //image(v, 0,0);
  int w = v.width/2;
  int h = v.height/2;
  float m1 = map(mouseX, 0 , width, width/8,(5*width)/8);
  
  /// ------------     grid 
  stroke(0);
  strokeWeight(20);
  for (int i  =0; i < width+1; i += width/4) {
    //line(i ,  0 , i ,height);
    for (int j  =0; j< height+1; j += height/4) {      
      //line(0 ,  j , width ,j);    //////// --------------------- ref for grid 
        
      
       copy(v, i, j, (int)m1, h/4, 0,j, (int)m1 , height/4); 
       copy(v, i+int(m1), j, w/4, h/4,int(m1),j, width-(int)m1 , height/4); 
    }
  }
  
  /// ----- XXXX 
}
