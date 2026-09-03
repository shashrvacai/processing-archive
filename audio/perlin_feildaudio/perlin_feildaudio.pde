import processing.sound.*;

Amplitude amp ;
AudioIn in ;

int cols, rows;
int scl= 20;
int w = 1800;
 int h = 1800;
 
 float fly = 0;

float [][] terrain;
void setup(){
  size(600,800,P3D);
  background(0);
  
  amp = new Amplitude(this);
  in = new AudioIn(this,0);
  in.start();
  amp.input(in);      // decide which aplitude to take 
  
  cols = w /scl;
  rows = h/scl;
  terrain = new float[cols][rows];
  
}

void draw(){
  fill(0,20);
    pushMatrix();
    translate(0,50,-2*width);
    //blendMode(DIFFERENCE);
    rect(0,-150,width,height/2);
      pushMatrix();
        translate(-50,0,width+700);
        rect(width/2+50,height/3,width/2,height);   
          pushMatrix();
            translate(0,-70,-70);
            rect(0,0,20,height);   
         popMatrix();
       popMatrix();
    popMatrix();
    noFill();
  float Am = amp.analyze();
  float AmL = Am*1000;
  fly -= 0.05;
  float H = map(mouseY, 0,height,0,150);
  float  yOff =fly;
  for( int y = 0; y < rows ; y ++){
    float xOff = 0;
      for (int x = 0; x < cols ; x ++){
        terrain[x][y] =  map(noise(xOff,yOff),0,1,-AmL,AmL);  //with noise
        xOff+=0.1;
      }
      yOff +=0.1;
    }
  

stroke(255);
noFill();

translate(width/2,height/2);

float mouse = map(mouseY,0,width,-PI/2,PI/2);
float mouseZ = map(mouseX,0,height,-PI/2,PI/2);
rotateX(mouse);
rotateZ(mouseZ);

translate(-w/2,-h/2);
   for( int y = 0; y < rows-1; y ++){
     beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols ; x ++){
      point(x*scl,y*scl, terrain[x][y]);
      //point(x*scl,(y+1)*scl,terrain[x][y+1]);
    }
    endShape();
  }
}

void mousePressed(){
  background(0);
}