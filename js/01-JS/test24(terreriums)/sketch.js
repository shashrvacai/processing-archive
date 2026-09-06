var yoff = 0;   
var a = 0;    // rotation angle
var count = 1;    // click counter

function setup() {
  createCanvas(800, 800);
  
}

function draw() {
	scale(0.7);
	translate(width/2, height/2);
  background(150,10,200,5*count/2);  
  rotate(a)           // spins the canvas
  noStroke();
  
  Flame(count, mouseX, mouseY);     // create instance 1
 	rotate(-PI);
  Flame(count,mouseX, mouseY);   // create instance2
   a+=0.003;
 }

function mousePressed(){      // increasing the number of loops
	if (count === 6){
		count===0;
	}else{
	count += count;
	}
}

