int c=0;
float angle=0;

void setup() {
  // fullScreen();
  size(1000, 1000);
  noStroke();
}

void draw() {
  background(242);
  scale(1.1);
       fill(255,196,92);
      rect(180, 35, 740, 770, 150);
     
  for (int i = 200; i< 750; i+= 200 ) {
    for (int j = 200; j< 750; j+= 200 ) {
      
      pushMatrix();
      rotate(PI/4);

      translate(i+width/2-200, j-height/2);   
      rotate(angle+i);


      c=20;
      //float rSub=map(mouseX, 0, width, 5, 20);
      //float aAdd=map(mouseY, 0, height, PI/2, PI/48);
      float rSub=4 ;    // number of circles
      float aAdd=PI/48;   // amount of rotation
      circle(100, rSub, angle, aAdd);

      popMatrix();
      angle+=PI/1220;
    }
  }
}

void circle(float radius, float rSub, float angle, float aAdd) {
  pushMatrix();
  do {
    fill(c, 0, 85);
    c=255-c;
    ellipse(0, 0, radius*2, radius*2);
    radius-=rSub;
    angle+=aAdd;
    float r=rSub*1;
    float x=cos(angle+aAdd)*r;
    float y=cos(angle)*r;
    translate(x, y);
  } while (radius>=1);
  popMatrix();
}