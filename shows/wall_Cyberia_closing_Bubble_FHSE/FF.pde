class FF {
  PVector[][] field;
  int cols, rows,res ;
  
  
  FF(int res_) {
    res =res_ ;
    cols =width/res ;
    rows = height/ res ;
    field =new PVector[cols][rows];
    init(res_,0.5);
  }

  void init(int uu_, float aa_) {
    res = uu_ ;
    noiseSeed((int)random(10000));
    float xoff = 0 ;
    for (int i =0; i < cols; i++) {
      float yoff = 0 ;
      for (int j =0; j < rows; j++) {
        float t =  map(noise(xoff, yoff), 0, 1, -PI,0) ;        
        field[i][j] = new PVector(cos(t), sin(t));
        yoff += aa_ ;
      }
      xoff += aa_ ;
    }
  }

  void show() {
    for (int i = 0; i < cols; i++) {
      for (int j=0; j < rows; j++) {
        drawVector(field[i][j], i*res, j*res, res-2);
      }
    }
  }

  void drawVector(PVector v, float x_, float y_, float sca_) {
    pushMatrix();
    translate(x_, y_);
    stroke(0, 10);
    rotate(v.heading2D());
    float l = v.mag()*sca_ ;
    line(0, 0, l, 0);
    popMatrix();
  }
  
  PVector lookup(PVector lookup_){
    int col = int(constrain(lookup_.x/res,0,cols-1));
    int row = int(constrain(lookup_.y/res,0,rows-1));
    return  field[col][row].get();
  }
}