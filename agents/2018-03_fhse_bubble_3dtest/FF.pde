class FF {
  PVector[][][] field;
  int cols, rows, res, depth;


  FF(int res_) {
    res =res_ ;
    cols =width/res ;
    rows = height/ res ;
    depth = 500/res ;  //     /// for floaw field in the z axis 
    field =new PVector[cols][rows][depth];
    init(res_, 0.5);
  }

  void init(int uu_, float aa_) {
    res = uu_ ;
    noiseSeed((int)random(10000));
    float xoff = 0 ;
    for (int i =0; i < cols; i++) {
      float yoff = 0 ;
      for (int j =0; j < rows; j++) {
        float zoff = 0 ;
        for (int k = 0; k < depth; k++ ) {
          float t =  map(noise(xoff, yoff, zoff), 0, 1, -PI, 0) ;        
          field[i][j][k] = new PVector(cos(t), sin(t),cos(t));
          zoff+= aa_ ;
        }
        yoff += aa_ ;
      }
      xoff += aa_ ;
    }
  }

  void show() {
    for (int i = 0; i < cols; i++) {
      for (int j=0; j < rows; j++) {
        for (int k=0; k < depth; k++) {
        drawVector(field[i][j][k], i*res, j*res,k*res, res-2);
        }
      }
    }
  }

  void drawVector(PVector v, float x_, float y_,float z_, float sca_) {
    pushMatrix();
    translate(x_, y_,z_);
    stroke(0, 10);
    rotate(v.heading2D());
    float l = v.mag()*sca_ ;
    line(0, 0, l, 0);
    popMatrix();
  }

  PVector lookup(PVector lookup_) {
    int col = int(constrain(lookup_.x/res, 0, cols-1));
    int row = int(constrain(lookup_.y/res, 0, rows-1));
    int dd = int(constrain(lookup_.z/res, 0, depth-1));
    return  field[col][row][dd].get();
  }
}
