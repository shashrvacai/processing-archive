int cols, rows;
int scl= 20;
int w = 1800;
 int h = 1800;
 
 float fly = 0;

float [][] terrain;
void setup(){
  size(600,600,P3D);
  
  cols = w /scl;
  rows = h/scl;
  terrain = new float[cols][rows];
  
}

void draw(){
  fly -= 0.05;
  float H = map(mouseY, 0,height,0,150);
  float  yOff =fly;
  for( int y = 0; y < rows ; y ++){
    float xOff = 0;
      for (int x = 0; x < cols ; x ++){
        terrain[x][y] = map(noise(xOff,yOff),0,1,-H,H);
        xOff+=0.1;
      }
      yOff +=0.1;
    }
  
background(0);
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