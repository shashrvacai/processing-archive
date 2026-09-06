var particlesQ = 1024;
var c = 0;

var m = new Array(particlesQ);
var x = new Array(particlesQ);
var y = new Array(particlesQ);
var vx = new Array(particlesQ);
var vy = new Array(particlesQ);

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function setup() {
	createCanvas(1000,1000);
	noStroke();
	fill(255, 128);
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function draw() {
	background(32);
	
	for (var a = 0; a < c; a++) {
		var ax = 0, ay = 0;
		
		for (var b = 0; b < c; b++) {
			if (a != b) {
				dx = x[b] - x[a];
				dy = y[b] - y[a];

				var d = sqrt(dx*dx + dy*dy);
				if (d < 1) d = 1;

				var f = (d - 256) * m[b] / d;
				ax += f * dx;
				ay += f * dy;
			}
		}
		
		var common = m[a] * 0.000001;

		vx[a] = vx[a] * 0.99 + ax * common;
		vy[a] = vy[a] * 0.99 + ay * common;
	}
	
	for (var i = 0; i < c; i++) {
		x[i] += vx[i];
		y[i] += vy[i];
		
		if ((x[i] < 0 && vx[i] < 0)    ||    (x[i] > width  && vx[i] > 0))    vx[i] = -vx[i];
		if ((y[i] < 0 && vy[i] < 0)    ||    (y[i] > height && vy[i] > 0))    vy[i] = -vy[i];
		
		ellipse(x[i], y[i], m[i], m[i]);
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function addNewParticle() {
	m[c] = random(4, 24);
	x[c] = mouseX;
	y[c] = mouseY;
	vx[c] = 0;
	vy[c] = 0;

	c++;
	if (c >= particlesQ) c = 0;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function mouseClicked() {
	addNewParticle();
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function mouseDragged() {
	addNewParticle();
}