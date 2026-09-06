var A = 0.0 ; 
var S = 0.07 ; // speed of rotation
var R = 0; var G = 0; var B = 0; 
var  x=0; var y = 0;



function setup() {
createCanvas(windowWidth,windowHeight) ;
 background(255);
strokeWeight(20); // thickness of the line 
}

function draw() {
// background(255)      // unquote this line to see how the program works .
	
  var L = map(mouseX,0,width,10,300);  //lenght of the first arm
  var L1 = map(mouseY,0,height,10,300);			//lenght of the second arm
  var  R = map (mouseX,0,width,0,255);	
  var  G = map (mouseY,0,height,0,255);
   
   fill(R,G,B)
   stroke(R,G,200); 
  
  translate (x,y);     //line1  can change it to anything other shape
  rotate(A);
 line(0,0,0,L);  
  

  translate (0,L); //line2
  rotate(A);
  line(0,0,0,L1);
  

  translate (0,L1); //line3
  rotate(A);
  line(0,0,0,L);
  
  var E = 0.05;
	var difX =mouseX-x;
	var difY = mouseY-y ;
	x += E* difX;
	y +=  E * difY
  A += S; 
}

function mousePressed(){
	S = -S; // mouseClick changes direction of rotation
	var  B = random(0,255); // click chhange B value to random
}