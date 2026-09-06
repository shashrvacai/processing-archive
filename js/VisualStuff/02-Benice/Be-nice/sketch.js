var path = [];
var angle = 0;
var resolution = 5;

var r=1; 
var sS ;    // spped of rotation
var G ; var B;   var R1; var G1; var B1;

var sun;
var end;

function setup() {
  createP('speed of rotation');
  sS= createSlider(0.01,20,5); createP('RGB-BG');
  R1 = createSlider(0,255,100);G1 = createSlider(0,255,200);B1 = createSlider(0,255,50);
  
   createCanvas(900, 900);
  sun = new Orbit(0, 0,75, 0);     // third parameter is the size of the cernter circle, rest are relative
  var next = sun;
  for (var i = 0; i < 19; i++) {        // decides the number of circles
    next = next.addChild();
  }
  end = next;
  background(255);
}


function draw() {
   background(R1.value(),G1.value(),B1.value(),5);                // background color
 translate(mouseX,mouseY);

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
  r = r + sS.value();
  
}