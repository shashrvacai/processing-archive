var screen = false ;

//screen 1 Variables
var A = 0;
var Ox =250;
var Oy = 470;
var Sc = 200;
var S =1;
var R = 10;

//preload
function preload() {
	BG = loadImage('Sj.jpg')
	img = loadImage('tapes.jpg')
}

function setup() {
  createCanvas(500,897);
  textFont("Arima Madurai")			// load font 
  textAlign(CENTER);
 
  imageMode(CENTER);
  image(BG,width/2,height/2,width,height);
}

function draw() {
	
  screen1();
   textSize(10);
  text("all images used are made by me",150,50);
   textSize(20);
  // collage 1
function screen1(){ 
	fill(255);
  	var ImagePos = random(0,width);
  	var SI = get(ImagePos,ImagePos,200,200);
  	var x = Ox + cos(A)*Sc;
  	var y = Oy + sin(A)*Sc;
  	image(SI,x,y,100,100);
  	if(Sc>=height/2){
  			Sc=200;
  	}	else{
				A += S;
  			Sc +=S;
  	}
	}
	
//collage 2 
function screen2(){
 	image(img,width/2,height/2,width,height);
 	textSize(10);
  text("all images used are made by me",150,70);
  textSize(20);
  	for (var p = 20; p < width; p += 20) {
    	var mx = mouseX / 50;
    	var Dx = dist(mouseX,mouseY,width/2,height/2);
    	var OA = random(Dx,0);
    	var OB = random(0, Dx);
    	var Red =  map(Dx,0,width/2,0,255);
    	var Opa = map(Dx,0,width/2,35,255);
    	strokeWeight(15);
    	stroke(Red,50,100,Opa);
    	line(p + OA, 0, p - OB, 1000);
  	}
	noStroke();
  fill(0,100);
  ellipse(width/2, height/2, 150,150);
  ellipse(width/2, height/2, 75,75);
	fill(255,100);
  ellipse(width/2, height/2, 5,5);
  fill(255);
	text("Come closer to the circle to get the lines at peace",width/2, height/2+100);
}
	
	if (screen === true){
		screen2();
	}else {
		screen1();
	}
}

function mousePressed(){
	screen = !screen;
}

