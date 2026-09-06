var Sc = 10;
var s ;
var F ; //Food
var L =  3 ; // levels


function setup() {
	frameRate(10);
  createCanvas(300,300);
  s = new Snake();
  PickLocation();
}

function draw() {
  background(0);
 
  if(s.eat(F)){
  	PickLocation();	
  } 
  s.death();
  s.update();
  s.show();
  var r = random(0,255); var g = random(0,255); var b = random(0,255);
  fill(r,g,b);
  ellipse(F.x,F.y,Sc,Sc);
}

function PickLocation(){
	var cols = floor(width/Sc);  // creating a grid
	var rows = floor(height/Sc);		// creating a grid
	F = createVector(floor(random(cols)),floor(random(rows)));    // cretes random a random position  
	F.mult(Sc);  
}

function keyPressed(){              // function of arrow keys
	if (keyCode=== UP_ARROW){
		s.dir(0,-1);
	} else if (keyCode=== DOWN_ARROW){
		s.dir(0,1);
	} else if (keyCode=== RIGHT_ARROW){
		s.dir(1,0);
	} else if (keyCode=== LEFT_ARROW){
		s.dir(-1,0);
	}
}