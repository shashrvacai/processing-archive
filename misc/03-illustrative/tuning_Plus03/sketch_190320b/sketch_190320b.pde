float unit = 14 ;
float jAdd = 0  ;

void setup() {
  size(600, 1600);
  surface.setResizable(true);
}

void draw() {
  pushMatrix();
  fill(0);
  rectMode(RIGHT);
  rect(0, 0, width, height);  
  popMatrix();


  
  for (int i = 1; i <=50; i ++) { 
      drawP(0, unit*i, unit+jAdd);  
      if(jAdd > width){
      jAdd = 0 ;
      }else {
      jAdd += unit*3 ;
      }
  }
}

void drawP(float r_, float x_, float y_) {
  pushMatrix();
  rectMode(CENTER);    
  stroke(0);
  fill(255);  

  translate(x_, y_);
  rotate(r_);

  rect(0, 0, unit*3, unit);
  rect(0, 0, unit, 1+unit*3);
  //r_ += 0.01;
  popMatrix();
}
