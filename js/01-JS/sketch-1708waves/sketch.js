var f = [];
var r = 0;

function setup() {
	background(0);
	createCanvas(600, 600);
	for (var i = 0; i < height; i += 10) { // create new object
		f[i] = new LANE(i, 10);
	}

}

function draw() {
	r = map(mouseX,0,width,0,100);
	translate(-width,0)
	stroke(255);
	strokeWeight(3)
	background(0,10);



	for (var j = 0; j < height; j += 100) {
		push()
		translate(j, j);
		for (var i = 0; i < f.length; i += 10) {

			push()
			translate(i * 3, 0);
			f[i].SS();
			pop();

		}
		pop();
	}
}

function LANE(A, h) {
	stroke(225)
	fill(0)

	this.SS = function() {
		this.x = sin(A) * r;
		this.y = cos(A) * r;
		ellipse(this.x, this.y,10,10);
		ellipse(-this.x,- this.y,10,10)
		//line(this.x, this.y, -this.x, -this.y);
		A += 0.005;
	}


}