float n = 4;
float a = 0;

void setup(){
  size(600,800);
  background(0);
 
 
}

void draw(){
  fill(0,15);
  rect(0,0,width,height);
  //noFill();
  
   
  stroke(255);
  strokeWeight(5);
  fill(0);
  blendMode(BLEND);
  
  pushMatrix();
  translate(width/2, width/2);
  for(int i = width/2 ; i > 0 ; i-= 15){
    float SW =  map(i , 0 ,width , 0.01,10);
    strokeWeight(SW);
    float r =  map(sin(a),1,-1,-(PI)/n,(PI)/n);
    float scl = map(sin(a),1,-1.5,0.8,1);
    //scale(scl);
    rotate(r);
    //n = map(mouseX,width,0,3,12);
  //blendMode(DIFFERENCE);
  int N = floor(n);
  polygon(0, 0,i, N); 
  }
  popMatrix();
  //a+= 0.01 ;
}

void mouseDragged(){
  a+= 0.005;
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}