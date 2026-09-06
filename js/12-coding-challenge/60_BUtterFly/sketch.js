var yoff = 0;

function setup() {
  createCanvas(600,600);
  
  
}

function draw() {
	background(51);
	translate(mouseX , mouseY);
  rotate(PI/2);
  scale(0.5);
  //r = 100;
  stroke(255,50);
  fill(120);
 	strokeWeight(4);
 	
 	var da = PI/300;
 	var dx = 0.01;
 	
  beginShape();
  var xoff = 0;
  for(var a = -PI/2; a <= PI/2; a+= da){
  	var n = noise(xoff,yoff);
  	var r = sin(2*a)*map(n,0,1,50,100);
  	xoff += dx;
  	var x= r *cos(a);
  	var y = sin(frameCount*0.4)*r* sin(a);
  	vertex(x,y);
  }
  
  
  for(var a = PI/2; a <= 3*PI/2; a+= da){
  	var n = noise(xoff,yoff);
  	var r = sin(2*a)*map(n,0,1,50,100);
  	var x= r *cos(a);
  	var y = sin(frameCount*0.4)* r* sin(a);
  	xoff -= dx;
  	vertex(x,y);
  }
  endShape();
  
	//yoff +=0.1;
  
}