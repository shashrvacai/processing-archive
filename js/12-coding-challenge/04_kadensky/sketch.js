var r1 = 80;  var r2 = 40;   // raduis
var amp2 = 290; var  amp1 = 80;   // amp
var A1 =0; var A2 =0; 
var sX = 300;
var sY =300;
var ran1 = 325; // variation in origin of the circles


function setup() {
  createCanvas(800,800);
}

function draw() {
  background(0,5);
 
  translate(sX,sY);
 	
  noStroke();
  fill(255,10,150);  // circle 1 
  var x = amp1 * sin(A1);   // oscilation
  ellipse(x,0,r1,r1);
	A1 += 0.07;   // speed 

  fill(50,210,150);  // circle2
   var y = amp2 * cos(A2);  // oscilation
  ellipse(ran1,y,r2,r2);  
  A2 += 0.02;   // speed 
  
  
}

function mousePressed(){
	sX = random(width/2-250,width/2+250);
	sY = random(height/2-250,height/2+250);
	ran1 = random(325,-325);
	r2 = random(40,340); r1 = random(30,240);
	amp2 = random(20,100);   amp1 = random(35,190);
}