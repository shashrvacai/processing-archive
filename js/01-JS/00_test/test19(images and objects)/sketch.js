var bubbles =  [];
var shibs= [];

function preload(){
	for (var  i = 0 ; i <2; i++){
		shibs[i]= loadImage('image/shivani'+i+'.jpg');
	}
	
}

function setup() {
  createCanvas(1000,1000);
}

 function mousePressed(){
		var b = new  Bubble(mouseX, mouseY,shibs[0]); 	
  	bubbles.push(b);

 }

function draw() {
	background(255);
	
	for (var i = 0; i < bubbles.length; i++){
		bubbles[i].move();
		bubbles[i].display();
	}
}

