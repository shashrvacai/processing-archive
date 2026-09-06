var path = [];
var angle = 0;
var resolution = 5;
var r1 ;
var r=1; 
var sS = 0.01;    // spped of rotation
var G ; var B;   

var sun;
var end;

function setup() {
 
  createCanvas(1000, 1000);
   r1 =createSlider(10,100,50);
  sun = new Orbit(0, 0,75, 0);     // third parameter is the size of the cernter circle, rest are relative
  var next = sun;
  for (var i = 0; i < 19; i++) {        // decides the number of circles
    next = next.addChild();
  }
  end = next;
  background(163,250,155 );                // background color
}

function draw() {
  translate(mouseX,mouseY);
  ellipse(150,150,r.value(),r.value());
  rotate(r);
  for (var i = 0; i < resolution; i++) {
    var next = sun;
    while (next !== null) {
      next.update();
      next = next.child;
    }
    path.push(createVector(end.x, end.y));
  }

   next = sun;
  while (next !== null) {
    next.show();
    next = next.child;
  }

  beginShape();
   G = map(mouseY,0,height,0,255);     
  B = map(mouseX,0,width,0,255);
  stroke(G,100,B,45);    // color of the BENICE CURVE  // mapping the G and B vaues with the mouse 
  noFill();
  for (var pos of path) {
    vertex(pos.x, pos.y);
  }
  endShape();
  r = r + sS;
  
}