var cnv;
var d;
var g;
var x = 0 ;
var e=0.05;
var circle = []
var q = 0;

function setup() {
  cnv = createCanvas(windowWidth,windowHeight);
  cnv.mouseWheel(changeSize); // attach listener for
                              // activity on canvas only
  d = 100;
  g = 0;
}
function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}

function draw() {
	translate(width/2,height/2);
  background(0);
  stroke(255);
  var alph = map(abs(width/2-q),0, width/2,0,255);
  
  g = g ;
  
  var dx = g - x ;
  x+= dx * e;
  for(var i =0 ; i < 5 ; i ++){
  	push()
  	fill(255,alph);
  	q= x+(i*width/3)
  	ellipse(q, 0, d, d);
  	ellipse(-q,-150,5,5)
  	pop()
  }
  
  
  
}

function changeSize(event) {
  if (event.deltaY > 0) {
    g += width/4;
  } else {
    g -= width/4;
  }
}