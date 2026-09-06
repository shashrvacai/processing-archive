var h = 600;
var w = 800;
var img;
var Dx = 0;

function preload() {
	img = loadImage('dress.png');
}

function setup() {
	createCanvas(800, 800);
	imageMode(CENTER);
	img.loadPixels();
	stroke(255, 255, 0);
}

function draw() {
		background(102);
	var mx = constrain(mouseX, width/2-w/4, width/2+ w / 4);
	var x = map(mx,width/2-w/4, width/2+ w/4, width-100,100);
	x = floor(x);

	for (var y=0; y<height; y++){
		var c = img.get(x,y);
		set(Dx,height-y/4,c);
		
		updatePixels();
		
	}
	image(img, mx, h/ 4, w / 2, h / 2);
	line(width - w / 2, 0, width - w / 2, h / 2);

	//loop
	Dx++ ;
	if(Dx >= width){
		Dx =0;
	}
}