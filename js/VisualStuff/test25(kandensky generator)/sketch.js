var r1 = 80;  var r2 = 40;   // raduis
var amp2 = 290; var  amp1 = 80;  var  amp3 = 45;var  amp4 = 66;  // amp
var A1 =0; var A2 =0; var  A3 = 0; 
var sX = 300;
var sY =300;
var ran1 = 325;  // variation in origin of the circles
var W1 = 400;var H1 = 400; var W2 = 200;var H2 = 200;

function setup() {
  createCanvas(800,800);
}

function draw() {
  background(0,5);
 
  translate(sX,sY);
 	
  noStroke();
  fill(255,10,150,122.5);  // circle 1 
  var x = amp1 * sin(A1);   // oscilation
  ellipse(x,0,r1,r1);
	A1 += 0.07;   // speed 
	
	  
  stroke(250,210,150);  // circle2
   var x2 = amp4* sin(A1)+W2;
   var y2 = amp4* cos(A2)+H2;  // oscilation
    var mouse2 = createVector(x2,y2);
  var center2 = createVector(W2,H2);
  mouse2.sub(center2);
  line(W2,H2,mouse2.x,mouse2.y);
    
  A3 += 0.04;   // speed
  
   noStroke();
  fill(50,210,150,122.5);  // circle2
   var y = amp2 * cos(A2);  // oscilation
  ellipse(ran1,y,r2,r2);  
  A2 += 0.02;   // speed 
  
  
 stroke(50,110,150);  // circle2
   var x1 = amp3 * sin(A1)+W1;
   var y1 = amp3 * cos(A2)+H1;  // oscilation
    var mouse1 = createVector(x1,y1);
  var center1 = createVector(W1,H1);
  mouse1.sub(center1);
  line(W1,H1,mouse1.x,mouse1.y);
    
  A3 += 0.04;   // speed 

  
  
}

function mousePressed(){
	sX = random(width/2-250,width/2+250);
	sY = random(height/2-250,height/2+250);
	ran1 = random(325,-325);
	r2 = random(40,340); r1 = random(30,240);
	amp2 = random(20,100);   amp1 = random(35,190);  amp3 = random(0,160);   amp4 = random(0,760);
	A2 = random(0.001,5);   A1 = random(0.001,5); A3 = random(0.001,5);
	W1 = random(-200,200);  H1 = random(-200,200);  W2 = random(-50,50);  H2 = random(-50,50);
}

