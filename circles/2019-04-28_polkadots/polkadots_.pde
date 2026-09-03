//unable to slow the animation .. need to use another way of alternating the 
// the colors.  

float grid = 40 ;
int c = 0 ;

void setup() {
  size(800, 800);
  rectMode(CENTER);
}

void draw() {
  background(0);
  translate(width,0);
  noStroke();

frameRate(1);

  for (int i = 0; i <=width; i++) {
    
    if (c % 2 == 0) {
      blendMode(ADD);
      //blendMode(DIFFERENCE);
      fill(255, 0, 0, 150);
    } else {
      fill(250, 218, 94, 150);
      blendMode(DIFFERENCE);
    }
    c ++ ;
    translate(0, grid);
    gridX();
    
   
  }
  
  //noLoop();
}

void gridX() {
  for (int i = -width; i <= width; i+= grid) {      
    rect(i, i, map(mouseY,0,height,grid,2*grid), map(mouseY,0,height,grid,2*grid), map(mouseX,0,width, 10,40));
  }
} 
