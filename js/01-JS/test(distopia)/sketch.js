var r =25;

function setup(){
	createCanvas(900,900);
	background(8,60,241);
	fill(8,60,241);
	strokeWeight(3);
	var count = 0
		
	 
	for(var y = 0	; y <height+30 ; y +=50){
	
	push();
	for(var x	= 0 ; x	<width+30	; x += 100){
			var ran = floor(random(0,19));
			if (count === ran ){
				
				beginShape();
			line(x,y,x+(r*2),r+y);
			stroke(255);
			line(x+(r*2)-20,r+y-5,x,y+(r*2));
			stroke(0);
			line(x,y+(r*2),x-(r*2),y+r);
			line(x-(r*2),y+r,x,y);
			endShape();
			pop();
			} else {
				stroke(1);
				beginShape();
			line(x,y,x+(r*2),r+y);
			line(x+(r*2),r+y,x,y+(r*2));
			line(x,y+(r*2),x-(r*2),y+r);
			line(x-(r*2),y+r,x,y);
			endShape();
			pop();
			}
			
		
	}
	
	
	count += 1;	
	console.log(count)
}

	
}

