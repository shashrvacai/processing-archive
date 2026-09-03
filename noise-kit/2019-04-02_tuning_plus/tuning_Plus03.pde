 
float increment = 0.01;
float zoff = 0.0;  
float zincrement = 0.02; 

float unit = 8 ;
float spin =  0.00 ;
int mFactor = 10;
float sp = -5*unit ;

OpenSimplexNoise n ;

void setup() {
  size(600, 1600);
  surface.setResizable(true);
   n = new  OpenSimplexNoise();
}

void draw() {
  ///// --------------------BG BLUR ----------///////
  //blendMode(BLEND);
  //pushMatrix();
  //fill(0);
  //rectMode(RIGHT);
  //rect(0, 0, width, height);  
  //popMatrix();
  //*******************************************//
  
  
  //--- Noiose
  
  blendMode(BLEND);
    loadPixels();
  float xoff = 0.0; // Start xoff at 0
  
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < height; y++) {
      yoff += increment; // Increment yoff
      
      // Calculate noise and scale by 255
   
     float bright = (float) n.eval(xoff,yoff,zoff)*155;
      

      // Try using this line instead
      //float bright = random(0,255);
      float Bmapped = map(bright, -1,1,0,255);
      
      // Set each pixel onscreen to a grayscale value
      pixels[x+y*width] = color(Bmapped,Bmapped,Bmapped);
    }
  }
  
  updatePixels();
  
  zoff += zincrement; // Increment zoff
  
   //----  main drawing
  

  float t = map(sin(spin),-1,1,0,PI/2);
  float addF = map(t, 0,PI/2, 0,4);

  grp(t, addF);
  for(int i = 10 ; i <= height ; i += 10){
  pushMatrix();
  translate(0,unit*i);
    grp(t , addF);
    
  popMatrix();
  }
  
  spin += 0.01 ;
}

void grp(float spin_, float addF_) {
  draw4iterate(spin_, unit, unit+sp, addF_);
  draw4iterate(spin_, unit*5, unit*3+sp, addF_);
  draw4iterate(spin_, unit*9, unit*5+sp, addF_);
}



void draw4iterate(float spin_, float tX_, float tY_, float addF_) {
  pushMatrix();
  translate(tX_, tY_);
  for (float i = unit+sp; i <= width; i+=(unit*mFactor)) { 
    drawP(spin_, i, unit , addF_);
    spin_ += PI ;
  }
  for (float i = unit*2+sp; i <= width; i+=(unit*mFactor)) {
    drawP(spin_, i, unit*4 , addF_);
  }
  for (float i = unit*3+sp; i <= width; i+=(unit*mFactor)) {
    drawP(spin_, i, unit*7, addF_);
  }
  for (float i = unit*4+sp; i <= width; i+=(unit*mFactor)) {
    drawP(spin_, i, unit*10, addF_);
  }
  popMatrix();
  
  
}


// ----------------------DRAW PLUS --------------------//
void drawP(float r_, float x_, float y_, float addF_) {
  pushMatrix();
  rectMode(CENTER);    
  noStroke();
  fill(255);  
  //blendMode(DIFFERENCE);
  translate(x_, y_);
  rotate(r_);
   
  rect(0, 0, unit*3, unit);
 
  
  rect(0, 0, unit, 1+unit*3);
  //r_ += 0.01;
  popMatrix();
}
// *****************************************************//
