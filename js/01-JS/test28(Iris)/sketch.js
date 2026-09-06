var a = 0;
var inc = 0.01;
var r = 50;
var aVel = 0;
var aAcc = 0.001;


function setup() {
  createCanvas(600,600);
}

function draw() {
  background(0,2);
  stroke(249,208,80,20);
  aAcc = map(mouseX, 0,width,-0.0001,0.0001)
  
  aSmal = constrain(aAcc,-0.001,0.001);
  
  //a += aVel;
  //aVel += aSmal;
  
  
 
 translate(width/2,height/2)
 for (var i = 2 ; i <=6;i+=2 ){ 
  for (var j = 1 ; j <=6;j+=2 ){ 
	  var x = sin(a)* (j*r);
	  var y = cos(a)* (j*r) ;
	  var v = sin(-2*a)* (i*r);
	  var w = cos(-2*a)* (i*r);
	  push()
		  line(v,y,-x,-w);
		 
		  line(x,w,-v,-y);
			  push()
			  rotate(PI/2)
			 	line(v,y,-x,-w);
		  	line(x,w,-v,-y);
			  
			  pop()
	  pop()
  }
}
  
  a += inc ;
}

function mousePressed(){
	background(0);
}