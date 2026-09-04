var A = 0.0
var S = 0.005;

function setup() {
	createCanvas(1200, 1000);
	noFill();

}

function draw() {
	//fill(172, 283, 38);
	//rect(1000, 0, 200, 200);
	var L0 = map(mouseX, width/2, width, 10, 300); // map on the width
	var L1 = map(mouseY, 0, height/2, 10, 300); // map on the height
	background(255, 10); // transparancy

	translate(500, 500);
	rotate(A);
	for (var i = 0; i < 6; i++) {
		push();
		fill(0);
		rotate(i * TWO_PI / 6);
		translate(0, L0);
		ellipse(0, 0, 50, 50);
		noFill();
		rotate(A);
		for (var j = 0; j < 5; j++) {
			push();
			rotate(j * TWO_PI / 5);
			translate(0, L1);
			ellipse(0, 0, 30, 30);


			rotate(A);
			for (var k = 0; k < 5; k++) {
				push();
				rotate(k * TWO_PI / 5);
				translate(0, L1);
				ellipse(0, 0, 10, 10);
				pop();

			}
			pop();
		}
		pop();
	}
	A += S;

}