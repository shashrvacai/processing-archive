var A = 0;
var O =300;
var S =0.5;
var R = 60;
var Sc = 10;

function setup() {
  createCanvas(600,600);
  background(104);
  noStroke();
}

function draw() {
    var r = random(0,255);
  var g = random(0,255);
  var b = random(0,255);
  fill(r,0,b);
  var x = O + cos(A)*Sc;
  var y = O + sin(A)*Sc;
  ellipse(x,y,R,R);
  
  if(Sc>=width/2){
    Sc=0.5;
  }else{
  Sc +=S;
  A += S;
  }
}