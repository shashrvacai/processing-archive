import geomerative.*;
float a =0 ;
// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont f;
RShape grp;
RPoint[] points;

void setup(){
  // Initilaize the sketch
  size(500,800);
  frameRate(24);

  // Choice of colors
  background(255);
  fill(255,102,0);
  stroke(0);  
  // VERY IMPORTANT: Allways initialize the library in the setup
  RG.init(this);  
  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 60 and the alignment CENTER
  grp = RG.getText("Thoughts", "FreeSans.ttf", 72, CENTER);

  // Enable smoothing
  smooth();
}

void draw(){
  // Clean frame
  background(255);
  
  // Set the origin to draw in the middle of the sketch
  translate(width/2, 3*height/4);
  
  //// Draw the group of shapes
  //noFill();
  //stroke(0,0,200,150);
  //RG.setPolygonizer(RG.ADAPTATIVE);
  ////grp.draw();
  
   //Get the points on the curve's shape
  RG.setPolygonizer(RG.UNIFORMSTEP);
  //RG.setPolygonizerStep(map(sin(a),-1, 1, 3, 100));
  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(map(sin(a),-1, 1, 3, 200));
  points = grp.getPoints();
  
  // If there are any points
  if(points != null){
    noFill();
    stroke(0,200,0);
    beginShape();
    for(int i=0; i<points.length; i++){
      //vertex(points[i].x, points[i].y);
    }
    endShape();
  
    fill(0);
    stroke(0);
    for(int i=0; i<points.length; i++){
      ellipse(points[i].x, points[i].y,5,5);  
    }
  }
  
  a+= 0.05 ;
}