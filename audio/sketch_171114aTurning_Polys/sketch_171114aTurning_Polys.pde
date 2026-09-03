import processing.sound.*;

float n = 9;
float a = 0;
float r =  0;

Amplitude amp;
AudioIn in;

void setup(){
  size(600,800);
  surface.setResizable(true);
  background(0);
   //  -- Audio In 
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
 
 
}

void draw(){
  float AIn =amp.analyze();
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
    
    float scl = map(sin(a),1,-1.5,0.8,1);
    //scale(scl);
    r+= AIn/100 ;
    rotate(r);
    //n = map(mouseX,width,0,3,12);
  //blendMode(DIFFERENCE);
  if (keyPressed == true) {
     if (key == 'e' || key == 'E') {    
      n =5 ;
    } else if (key == 's' || key == 'S') {
      if (n > 1) {
        n -=0.01 ;
      } else {
        n = 1 ;
      }
    } else if (key == 'a' || key == 'A') {    
      n += 0.01 ;
    }
  }
  
  int N = floor(n);
  polygon(0, 0,i, N); 
  }
  popMatrix();
  a+= AIn/10 ;       // turning speed 
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