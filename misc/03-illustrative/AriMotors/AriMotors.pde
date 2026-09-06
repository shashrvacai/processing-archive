
float rotA = 0.01;        // rotation speed on img1
float rotB = - 0.001;     // rotation speed on img2   u can use negative values 
int Er1 = 500 ;                     //------  size on first image 
int Er2 = 500 ;                     //------  size on second image 

// MOVE THE IMAGES

int tw1 = 0 ;     // image 1 sideways               negative valus are accepted
int th1 = 10 ;    // image 1 vertically              negative valus are accepted
int tw2 = 0 ;     // image 2 sideways 
int th2 = 0 ;     // image 2 vertically

PImage img1, img2;
float a = 0, b = 0 ; 

void setup() {
  size(1000, 1000);
  imageMode(CENTER);
  img1 = loadImage("01.png");             // name of the first image
  img2 = loadImage("02.png");             // name of the second image
}

void draw() {
  pushMatrix();
  fill(200, 100);
  rect(0, 0, width, height);
  popMatrix();

  pushMatrix();
  translate(width/2 +tw1, height/2 +th1);
  rotate(a);
  image(img1, 0, 0 , Er1,Er1);
  popMatrix();

  pushMatrix();
  translate(width/2 + tw2, height/2 +th2);
  rotate(b);
  image(img2, 0,0,  Er2, Er2);
  popMatrix();

  b += rotA;
  a += rotB;
}
