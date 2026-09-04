import org.openkinect.processing.*;

PGraphics2D  Kanvas;
Kinect2 K ;   // k in the kinect object

PVector pos, nOff, iPos, iDim;
PGraphics2D pg ;
PImage g ;
int rx, lx, dY, ty, by, dX, rStart, lStart, tStart, bStart, resetMin;
int dMax=  1250, dMin = 280 ;    // depth of the kinect

void setup() {
  size(1280, 720, P2D);

  K = new Kinect2(this);
  K.initDepth();  // int depth ; 
  K.initVideo();
  K.initRegistered();
  K.initDevice();
  
  Kanvas = (PGraphics2D)createGraphics(width, height, P2D);
  
  pg = (PGraphics2D)createGraphics(width, height, P2D);    
  iDim = new PVector(650, 350);  // name of the image 
  iPos = new PVector(width/2-iDim.x/2, (height)-iDim.y);                                  // position of the image 
  // size of the image 

  pos = new PVector(0, 0);
  nOff = new PVector(random(10000), random(1000));
  resetMin = -100 ;                                                        // reset after 400 millisecs 
  rStart =  int(iPos.x +iDim.x);                                           // start poistion of right side scan 
  lStart =  int(iPos.x);                                                 // start poistion of left side scan 
  tStart =  int(iPos.y);                                                   // start poistion of top scan 
  bStart =  int(iPos.y+iDim.y);                                            // start poistion of bottom scan 

  rx =  rStart;
  lx =  lStart ;
  ty = tStart ;
  by = bStart ;
  dY = int(iPos.y ) ;
  dX = int(iPos.x);
}


void draw() {  
  Kanvas.beginDraw();
  pushMatrix();
  scale(2);
  Dkinect();
  popMatrix();
  Kanvas.endDraw();
  
  pg.beginDraw();
  pos.x = map(noise(nOff.x), 0, 1, 0, width);
  pos.y = map(noise(nOff.y), 0, 1, 0, height);
  
  int scanX = (int)map(pos.x, 0, width, 0, Kanvas.width);
  int scanY = (int)map(pos.y, 0, height, 0, Kanvas.height);    

  dY = (int)map(pos.y, 0, width, iPos.y-iDim.y/2, iPos.y+iDim.y/2);
  dX = (int)map(pos.x, 0, width, iPos.x-iDim.x/2, iPos.x+iDim.x/2);
  nOff.add(0.01, 0.01, 0);

  image(Kanvas, iPos.x, iPos.y, iDim.x, iDim.y);                 // position of the image 
  copy(Kanvas, scanX, 0, 1, Kanvas.height, rx, dY, 1, int(iDim.y)) ;    // right side 
  if (ty< resetMin) {
    rx = rStart;
    dY = int(iPos.y );
  } else {
    rx+= 1 ;
  }
  copy(Kanvas, scanX, 0, 1, Kanvas.height, lx, dY, 1, int(iDim.y));   // left side 
  if (ty< resetMin) {
    lx = lStart;
  } else {
    lx-= 1 ;
  }

  copy(Kanvas, 0, scanY, Kanvas.width, 1, dX, ty, (int)iDim.x, 1);   // top scan 
  if (ty< resetMin) {
    background(0);
    ty = tStart; 
  } else {
    ty-= 1 ;
  }

  copy(Kanvas, 0, scanY, Kanvas.width, 1, dX, by, (int)iDim.x, 1);   // bottom scan 
  if (ty< resetMin) {
    background(0);                                               // if you want background to reset

    by= bStart;
  } else {
    by+= 1 ;
  }

  pg.endDraw();    

  image(pg, 0, 0);
}
