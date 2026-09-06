  var x = 0;
  var y= 0;
  var Tx = 0;
  var Ty = 0 ;
  
function setup() {
  createCanvas(600,600);
}

function draw() {
//background(255);  background 
  rect (x, y, 50,50)
 // line(x,0,x,height); line to test the code
  
  var easeIn = 0.125;
  var difx = Tx - x;
  var dify = Ty - y;
  x+=difx * easeIn;
  y+=dify * easeIn;
}

function mousePressed(){
  Tx = mouseX;
  Ty = mouseY;
}