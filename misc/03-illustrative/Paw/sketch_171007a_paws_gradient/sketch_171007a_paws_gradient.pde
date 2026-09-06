// you can comment a line of code by using '//' before it 

float  si = 100;   // size of the rect/ellipse 
float skip = 13;   // dist between the 2 circles/rect  .. dont make this a decimal 


void setup(){
  size(600,600);                    //size of the image in pixels  
  
}

void draw(){
  background(255);                  // backgroung color  
  for (int i = 0; i <width ; i+= skip){    // dist X ,Y
    for (int j = 0; j <height ; j+= skip){
      float R = map (i , 0,width, 100,200);      // R and G values create an gradient
      float G = map (j , 0,height, 200,20); 
      noStroke();                              // commnt this to get an outline
      stroke(0,12,100,40);                              // you can add color to the outline 
      strokeWeight(1);                      // outline to the ellipse
      fill(G,R,10,5);                        // (R,G,B,alpha) 
      rect(i,j, si, si );                    //(x,y,width,height)
      //ellipse(i,j, si, si );
    }
  }
}