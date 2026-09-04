import geomerative.*;


PVector pos, nOff;
PGraphics pg;
int  t, tStart  , a  ;
RFont f;
RShape grp;

void setup() {
  size(400, 1000, P2D);
  frameRate(24);
  
  pg = createGraphics(width, height, P2D);
  pos = new PVector(0, 0);
  nOff = new PVector(random(10000), random(1000));

  RG.init(this);
  background(0);
  a = 0;
  rectMode(CENTER);
  //noFill();

  tStart = height/2 - 3 ;
  t = tStart ;              // starting point  

  grp = RG.getText("Scanning", "FreeSans.ttf", 72, CENTER);
  smooth();
}

void draw() {
  if(mousePressed){
    pg.background(0);
  }
  pos.x = map(noise(nOff.x), 0, 1, width/4,width/2);
  pos.y = map(sin(a), -1, 1,-40, 40);
  
  
   pushMatrix();
  translate(pos.x, height/2);

  noStroke();
  rect(0,-34,width,100);
  fill(0);
  stroke(255);
  grp.draw();
  popMatrix(); 
  pg.beginDraw();

  //line(0,(int)(tStart+pos.y),width,(int)(tStart+pos.y));
  copy(0, (int)(tStart+pos.y), width, 1, 0, t, width, 1);   // top scan 


  if ( t > height) {   
    t = tStart;
  } else {    
    t += 1;
  }
  
  
  nOff.add(0.01, 0.01, 0);
  pg.endDraw();
  image(pg, 0, 0);
  a +=0.01 ;
}

void mousePressed(){
   pg.background(0);
}
