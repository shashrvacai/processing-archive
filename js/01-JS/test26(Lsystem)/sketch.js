var angle;
var axiom = "F";
var sentence = axiom;
var len = 100;
var r = 10;

var rules = [];
rules[0] = {
	a: "F",
	b: "FF+[+F-F-F]-[-F+F+F]"
}

function generate() {
	len *= 0.5;
	var nextSentence = "";
	for (var i = 0; i < sentence.length; i++) {
		var current = sentence.charAt(i);
		var found = false;
		for (var j = 0; j < rules.length; j++) {
			if (current == rules[j].a) {
				found = true;
				nextSentence += rules[j].b;
				break;
			}
		}
		if (!found) {
			nextSentence += current;
		}
	}
	sentence = nextSentence;

	turtle();

}

function turtle() {
	resetMatrix();
	
	translate(width / 2, height);
	stroke(255, 100);
	for (var i = 0; i < sentence.length; i++) {
		var current = sentence.charAt(i);
		len = map(mouseY, 0, height, 0, 100)
		if (current == "F") {
			push();
			rotate(r)
			fill(255, 0, 0, 50)
			rect(-len / 2, len / 2, len, -len);
			rect(-len, len , len, -len);
			r+= 0.01;
			pop();
			fill(0, 50)
			ellipse(0, 0, len/2, -len/2);
			//line(0, 0, 0, -len);
			translate(0, -len);
		} else if (current == "+") {
			rotate(angle);
		} else if (current == "-") {
			rotate(-angle)
		} else if (current == "[") {
			push();
		} else if (current == "]") {
			pop();
		}
	}
}

function setup() {
	createCanvas(800, 800);

}

function draw() {
	angle = radians(map(mouseX, 0, width, 0, 360));
	background(0, 10);
	turtle();
}

function mousePressed() {
	generate();
}