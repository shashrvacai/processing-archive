var S =5;
var D = 100;
var x;
var y ;
var T1 = 2000;
var T2 =4000;


function setup(){
  createCanvas(1000,1000);
  x = width/2;
  y = height/2;
  background(204);
}

function draw(){
  var c = 0;
  c++ ;
   if (c<255){
    c=0;
  }
  stroke(255);
  x+= random(-S,S);
  y+= random(-S,S);
  fill(c);
  ellipse(x,y,D,D);
  var CT = millis()
  if (CT >T2 ){
    S=20;
  }else if (CT > T1){
    S=10;
  }
  
 
}