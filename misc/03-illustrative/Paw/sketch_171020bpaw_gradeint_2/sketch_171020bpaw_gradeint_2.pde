float  skip = 10 ;    //intital distance between the 2 
float r = 10 ;
float inc = 0.5;/// increment  
color top = color(100,304,200);        // color 1
color bottom =  color(200,177,5);        // color 2 


void setup() {
  size(800, 800);
  background(255);   
  for (int i = 0; i < width; i += 10) {
    for (int j = 0; j < height; j += skip) {
      
      noStroke();
      float C = map(i , 0, width,0,1);
      color c = lerpColor(top,bottom,C);
      fill(c);
      ellipse(j, i, r, r);                  // the intended shape    
      
      //r+= inc;
    }
    skip+=inc ;
  }
}