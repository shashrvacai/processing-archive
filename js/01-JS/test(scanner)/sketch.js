var s = 200;
var  DP = 0;
var center;
var img;

function preload(){
	img = loadImage('me.png');
}

function setup() {
  createCanvas(windowWidth,windowHeight);
  imageMode(CENTER);
  img.loadPixels();
  stroke(255,255,0);
  center = width/2
  background(0);
}

function draw() {
	
	var mx = constrain(mouseX, center-s/2,center+s/2);
	
	var x = map(mx,center-s/2,center+s/2,450,0);
	x = floor(x);
	
	for (var y=0; y<height ; y++){
		var c = img.get(x,y);
		set(DP,y,c);
	}
	updatePixels();
	
	//thumbnail
	image(img,mx,height-s/2,s,s);
	line(width/2,height-s,width/2,height);

	
	//loop
	DP ++;
	if(DP >= width){
		DP = 0;
	}
}
