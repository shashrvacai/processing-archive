// you can comment a line of code by using '//' before it 

float  si = 100;   // size of the rect/ellipse 
float skip = 50;   // dist between the 2 circles/rect  .. dont make this a decimal 
float A = 0 ;

void setup(){
  size(600,600);                    //size of the image in pixels  
  rectMode(CENTER);
  
}

void draw(){
  background(255);                  // backgroung color  
  for (int i = 0; i <width+skip ; i+= skip){    // dist X ,Y
    for (int j = 0; j <height+skip ; j+= skip){
      float R = map (j , 0,width, 100,200);      // R and G values create an gradient
      float G = map (j , 0,height, 200,20);
      float B = map (j , 0,height, 200,20);
      noStroke();                              // commnt this to get an outline
      stroke(0,12,100,40);                              // you can add color to the outline 
      strokeWeight(1);                      // outline to the ellipse
      fill(R,G,B);               // (R,G,B,alpha) 
      pushMatrix();
      translate(i,j);
      rotate(A);
      rect(0,0, si, si );  
      popMatrix();
                        
      //ellipse(i,j, si, si );
    }
  }
  A+= 0.005; 
  
}