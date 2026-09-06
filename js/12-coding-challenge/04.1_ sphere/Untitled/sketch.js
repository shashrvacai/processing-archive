var A = 0; // starting point
var r = 70; // length of the arm
var S = 0.09; // speed of rotation

function setup() {
	createCanvas(700, 700);
	background(60, 45, 253); // starting BG

}

function draw() {
	background(60, 45, 253, 2); // Bg colors  
	drawlines();
	A += S;
}

function drawlines() {
	


	
	for (var i = 70; i < 700; i += 70) {
		for (var j = 70; j < 700; j += 70) {
			
			
			var R = map(i,0,width,0,255);
			var G = map(j,0,height,0,255);
			var B = map(sin(A),-1,1,0,255);
			//noStroke(); 
			//stroke(255)                       //optional code
			  stroke(R, G, B,50);//lineColor
			//fill(R,G,B,5);
			noFill();
			
			var x = r * sin(A) + i;
			var y = r * cos(A) + j;
	
			//line(i, j, x, y);
			
			var ss = 140 ;  //size of the rect or circle
			//OR
			 ellipse(x,y,ss,ss);
			//Or
			//rect(x,y,ss,ss);
			
		}

	}

}

