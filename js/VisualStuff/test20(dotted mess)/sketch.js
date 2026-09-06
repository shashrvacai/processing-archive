var D = 12; // ---- 1st ellipse size
var aOA ;  // offset value 1
var aOB ;  // offset value 2

function setup() {
  createCanvas(1000,1000);
  noStroke();
  
  frameRate(1);
  
  aOA = radians(1.5);
  aOB = radians(50);
}

function draw() {
  background(255,15);
  var R = random(-270,270);
  var G = map(R,-270,270,0,255);
  var B =  random(0,255);
   var r =  random(0,255);
  fill(r,G,B);
  seed1 (D,radians(R),width/2,height/2);
}


function mousePressed () {
  background(255,45);
  seed1(D,radians(270),mouseX,height/2);
}