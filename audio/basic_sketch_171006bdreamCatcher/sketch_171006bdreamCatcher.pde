float A = 0 ;
Dc dc;


void setup() {
  size(1000, 1000, P3D);
  rectMode(CENTER);
  background(0,5);
  dc = new Dc();
}

void draw() {
  
  fill(0,20);
  
  rect(0,0,width*2,height*2);
  noFill();
  
  stroke(255);
  strokeWeight(1);
  
  int b = 1 ;
  for (int i =0 ; i < width+500 ; i +=200){
    for (int j =0 ; j < height+500 ; j +=200){
      dc.DCdraw(i,j,200,b);
      b +=10 ;
    }
  }
    A += 0.05;
    
    pushMatrix();
    translate(0,0,250);
    noStroke();
    
    //fill(0);
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