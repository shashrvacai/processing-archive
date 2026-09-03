float n = 4;
float a =  0 ;
void setup() {
  size(800, 800);
}

void draw() {
  background(193, 0, 113);
  float amap = sin(a);
  noFill();
  float r2 = map(amap, 0, 1, 0, -PI/2);
  float add = 20 ;
  //for(int i = 0 ; i < 1.5*width ; i+= add){
  //  strokeWeight(add/2);
  //polygon(width/2, height/2, i, 4, r2);
  //}
    pushMatrix();
  translate(width/2, width/2);
  for(int i = width ; i > 0 ; i-= add){
    float SW =  map(i , 0 ,width , 0.01,10);
    strokeWeight(add/2);
    float r =  map(sin(a),1,-1,-(PI)/n,(PI)/n);
    float scl = map(sin(a),1,-1.5,0.8,1);
    //scale(scl);
    rotate(r);
    
  int N = floor(n);
  polygon(0, 0,i, N,r2); 
  }
  popMatrix();
  a+= 0.01 ;
}

void polygon(float x, float y, float radius, int npoints, float r2_) {
  float angle = TWO_PI / npoints;
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    float sx1 = x + cos(a+r2_) * radius ;
    float sy1 = y +  sin(a+r2_) * radius ;
    float sbx = x + cos(a+r2_+angle) * radius ;
    float sby = y +  sin(a+r2_+angle) * radius ;
    float sbx1 = x + cos(a+angle) * radius;
    float sby1 = y + sin(a+angle) * radius;
    
    //line(sx, sy, sx1, sy1);  // aa'
    //blendMode(BLEND);
    stroke(0, 171, 79);
    line(sx, sy, sbx1, sby1);    // ab
    
    noFill();
   //blendMode(DIFFERENCE);
     stroke(242, 226, 0);
    line(sx1, sy1, sbx, sby); // a'b'
     ////blendMode(SUBTRACT);
    //oStroke();
    //ill(0, 171, 79);
    //ect(100,100,200,300);
  }
  
}