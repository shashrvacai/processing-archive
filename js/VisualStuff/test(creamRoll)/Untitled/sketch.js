var A = 0;
var O = 60;
var Sc = 140; // dist of the ellipse from the center
var S = 0.05;  // speed of the spin  i.e 

var r ; var b; var g;


function setup() {
  createCanvas(1000,1000);
  background(0);
}

function draw() {
  var size = 100; // adjust ellipse size
  
  var mX = map(mouseX,0,width,200,width-200);
  var mY = map(mouseY,0,height,200,height-200);
  var x = width/2 + cos(A)*Sc;
  var y =height/2  + sin(A)*Sc; 
   r = map(mouseX,0,width,100,200); //color values between 0-255
  g = map(mouseY,0,width,50,150); //color values between 0-255
  stroke(255)
  fill(r,g,b);
  ellipse(x+mX,y,size,size); 
  A += S;
}

function mousePressed(){
 b = random(0,255); 
}