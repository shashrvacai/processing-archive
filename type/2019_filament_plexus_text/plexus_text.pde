import geomerative.*;
float a =0 ;
// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont f;
RShape grp;
RPoint[] points;

void setup(){
  // Initilaize the sketch
  size(1600,1600);
  frameRate(24);

   RG.init(this);  
  grp = RG.getText("Filament", "FreeSans.ttf", height/4, CENTER);
  //blendMode(DIFFERENCE);
  // Enable smoothing
  smooth();
}

void draw(){
 //  background(255);
 pushMatrix();
 fill(255);
 rect(0,0,width,height);
 popMatrix();
  
  // Set the origin to draw in the middle of the sketch
  translate(width/2, height/2);
  
  //// Draw the group of shapes
  noFill();
  stroke(0,0,200,150);
  RG.setPolygonizer(RG.ADAPTATIVE);
 // grp.draw();
  
   //Get the points on the curve's shape
  RG.setPolygonizer(RG.UNIFORMSTEP);
  RG.setPolygonizerStep(map(sin(a),-1, 1, 300, 100));
  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(map(sin(a),-1, 1, 2, 200));
  points = grp.getPoints();
  
  // If there are any points
  if(points != null){
    fill(0);
    //noFill();
    stroke(255);
    //noStroke();
    beginShape();
    for(int i=0; i<points.length; i++){
      vertex(points[i].x, points[i].y);
    }
    endShape();
  
    
    stroke(0);
    for(int i=0; i<points.length; i++){
      //ellipse(points[i].x, points[i].y,0.5,0.5);  
    }
  }
  
  a+= 0.009 ;
}
