var A = 0.0  
var S =0.005; // speed
var x = 500 ;
var y = 500 ;

function setup() {
  createCanvas(1200,1000);
  noFill();
  
}

function draw() {
	fill(172,283,38);      // mapping rectangle
  rect(1000,0,200,200);
  
  
	var L0 = map(mouseX,1000,width,10,300);
	var L1= map(mouseY,0,200,10,300);
	background(255,50);    // this is what is giving the trails .. to switch it off turn Opcity to 255
	

	
	translate(500,500);
	rotate(A);
	for(var i =0; i<9 ; i++){   
		push();
		fill(0);  // center 
		rotate(i*TWO_PI/9);   
		translate(0,L0); 
		ellipse(0,0,50,50);   // raduis of primary circle
		noFill();
			rotate(A);
			for(var j =0; j<5 ; j++){
				push();
					rotate(j*TWO_PI/5);
					translate(0,L1);
					ellipse(0,0,30,30);    // raduis of secondary circle
				
				
				rotate(A);
			for(var k =0; k<8 ; k++){ // inc the number of circles 
				push();
					rotate(k*TWO_PI/5);  
					translate(0,L1);
					ellipse(0,0,10,10); //  small babies
				pop();
				
	}
	pop();
			}
	pop();
	}
	A += S;
  
}