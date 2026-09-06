var A =0.0;
var O = 60;
var Sc =250;
var S = 0.05;

function setup() {
  createCanvas(600,600);
}

function draw() {
 
 background(0);
  for(var x = 40 ; x <=width; x+=40){
    for(var ot =0 ;ot<=10; ot+=0.04);
    var y1 = height/2 + sin(A+ot)*Sc;
    ellipse(x,y1,40,40); 
    A += 0.2;
  }
}