class FF {
  PVector [][] f ;
  int cols, rows ;
  int res ,a ;

  FF(int r_) {
    a = 0 ;
    res = r_ ;
    cols = width/res ;
    rows = height/res ;
    f = new PVector[cols][rows];
    //init(random(10));
  }

  void init(float a_) {
    noise(150000);
    float Aa = map(mouseX , 0 , width, -TWO_PI,TWO_PI);            // 
    float xoff = 0 ;   
    for (int i = 0; i < cols; i ++) {
      float yoff = 0 ;
      for (int j = 0; j < rows; j++ ) {
       float t = map(noise(xoff*Aa,yoff*Aa),0,1,-PI,PI);
        f[i][j]= new PVector(cos(t), sin(t));        
        yoff += 0.1 ;
      }     
      xoff += 0.1 ;
    }
   
  }

  void display() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        drawVector(f[i][j], i*res, j*res, res-2);
      }
    }
  }

  void drawVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    float arrowsize = 4;
    translate(x, y);
    stroke(0, 100);    
    rotate(v.heading2D());
    float len = v.mag()*scayl;
    line(0, 0, len, 0);
    //line(len,0,len-arrowsize,+arrowsize/2);
    //line(len,0,len-arrowsize,-arrowsize/2);
    popMatrix();
  }


  PVector lookup(PVector lookup) {
    int colum = int(constrain(lookup.x/res, 0, cols-1));
    int row = int(constrain(lookup.y/res, 0, rows- 1));
    return f[colum][row].get();
  }
}
