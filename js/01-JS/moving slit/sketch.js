let img, img1, img3;
let a = 0,
	w = 1;
var can1, can2, can3;
var imgSize = 750;
let t = 'is one type of moiré pattern; a pattern that appears when superposing two transparent layers containing correlated opaque patterns. Line moiré is the case when the superposed patterns comprise straight or curved lines. When moving the layer patterns, the moiré patterns transform or move at a faster speed. This effect is called optical moiré speedup.'


function windowResized() {
  //console.log('resized');
  resizeCanvas(windowWidth, windowHeight);
}

function preload() {
	img = loadImage('03.jpg');
	img1 = loadImage('bird.jpg');
	img2 = loadImage('fish.jpg');
	img3 = loadImage('02.jpg');
}

function setup() {
	can1 = createCanvas(windowWidth, 3000);

	//	can2 = createCanvas(750, 750);
	w = imgSize / 500;

}

function draw() {
	background(255);
	fill(0);


	imageMode(CENTER);
	image(img, width / 2, 375, imgSize, imgSize);
	image(img1, width / 2, 1125, imgSize, imgSize);
	image(img2, width / 2, 1775, imgSize, imgSize);
	image(img3, width / 2, 2650, imgSize, imgSize);


	let x = sin(a) * 93 - 14.9;

	fill(0);

	push();
	let xx = map(mouseX,0 ,width,-40,40)
	translate(xx, 0);
	drawSlit();
	pop();

	stroke(255);
	fill(255);
	textSize(40);
	textFont('Raleway');

	text('Line moiré ', width / 6, height / 5);
	textSize(20);
	
	text(t, width / 6, height / 5 +25 ,500,300);
	a += 0.005;

}

function drawSlit() {
	stroke(0);
	for (let i = -40; i < 40+width ; i += 5 * w) {
		ellipse(i, mouseY, w * 4, 700);
	}

}