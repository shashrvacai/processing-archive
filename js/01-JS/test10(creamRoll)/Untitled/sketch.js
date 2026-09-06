var A = 0;
var O = 60;
var Sc = 40;
var S = 20;
var D = 5;
var  i =0; var j= 0;


function setup() {
  createCanvas(1000,1000);
  background(0);
}

function draw() {
  
  var mX = map(mouseX,0,width,200,width-200);
  var mY = map(mouseY,0,height,height/3-200,height/2+400);
  var x = mX + cos(A)*Sc;
  var y = mY +200 + sin(A)*Sc; 
  var r = map(mouseX,0,width,100,200);
  var g = map(mouseY,0,width,100,200);
  
  fill(r,g,40);
  ellipse(x,y,40,40);
  A += S;
  var E= 0.025
  
}