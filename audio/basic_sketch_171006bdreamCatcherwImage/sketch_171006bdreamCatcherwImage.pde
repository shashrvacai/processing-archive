float A = 0 ;
Dc dc;
PImage ink ;
int si = 500;    // size


void setup() {
  size(1000, 1000, P3D);
  rectMode(CENTER);
  background(0,5);
  dc = new Dc();
  ink = loadImage("ink.jpg");
}

void draw() {
  
  fill(0,20);    //
  
  rect(0,0,width*2,height*2);
  noFill();
  
  stroke(255);
  strokeWeight(1);
  
  int b = 1 ;
  for (int i =0 ; i < width+500 ; i +=si){
    for (int j =0 ; j < height+500 ; j +=si){
      dc.DCdraw(i,j,si,b);
      b +=5 ;
    }
  }
    A += 0.05;
    
    pushMatrix();
    translate(0,0,250);
    noStroke();
    //image(ink, 270,310,300,300);
    fill(255,150,200);
    //rect(420,450,350,200);
    //fill(255);
    //textSize(25);
    //text("this.placeholder()",300,450);
    popMatrix();
    println(mouseX +" " + mouseY);
}

void keyPressed(){
  //background(0);
}