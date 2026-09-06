var A = 0.0;

function setup() {
	createCanvas(windowWidth, windowHeight);
}

function draw() {
	background(255);
	fill(0, 0);
	translate(width / 2, height / 2);
	/*	// black circle
	strokeWeight(1); 
	stroke(0);
 		for(var r=15; r<500; r+=15){
 			ellipse(0,0,r,r);
 		} */

	strokeWeight(7);
	// cyan
	stroke(0, 174, 239, 127);
	rotate(A);
	for (var i = 15; i < 300; i += 15) {
		ellipse(105, 0, i, i);
	}

	// Yellow
	stroke(255, 242, 0, 127);
	rotate(A);
	for (i = 15; i < 300; i += 15) {
		ellipse(105, 0, i, i);
	}
	//magenta
	stroke(236, 0, 140, 127);
	rotate(A);
	for (i = 15; i < 300; i += 15) {
		ellipse(105, 0, i, i);
	}
	A += 0.01;
}
