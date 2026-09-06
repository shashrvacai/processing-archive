import oscP5.*;
OscP5 oscP5;

int nRepeat =5 ;     // num of repeatations
float elpX = 2.2 ;      // curvefactor
float elpY = 175 ;
int nEllipse = 12 ;   // number of ellipses 

float nRadX , nRadY ;

float xInc = 10, yInc = 20 ; // inc factor for and X & Y,if same will draw parallel ellipse 
float mElpy, mScale ;
float daCh1 = 0 ,daCh2 = 0,daCh3 = 0,daCh4 = 4,daCh5 = 0,daCh6 = 0 ; 

void setup() {
  smooth();
  size(750, 750);
  background(0);
}

void draw() {
  pushMatrix();
    noStroke();
    fill(0);
    rect(0, 0, width, height);
  popMatrix();
  
  float angrot = 0.0;
  float angrotInc = ((180/nRepeat)) ;
  
  if(yInc > 0){mElpy = elpY +(nEllipse *yInc);}
  mScale = height/mElpy;
  
  noFill();
  strokeWeight(2);
  stroke(255);
  for (int j = 0; j < nRepeat; j++) {
    dEllipse((elpX*mScale),(elpY*mScale),nEllipse,(xInc*mScale),(yInc*mScale),angrot) ;
    angrot = angrot + angrotInc;
  }
}

void dEllipse(float radx_,float rady_,int num_,float radxinc_,float radyinc_,float ellprot_){
    nRadX = radx_;
  nRadY = rady_;
  for (int i = 0; i < num_; i++) {
    push();
    translate(width/2,height/2);
    rotate(radians(ellprot_));
    ellipse(0,0,nRadX,nRadY);
    pop();
    nRadX = nRadX + radxinc_;
    nRadY = nRadY + radyinc_;
  }
}
