function Bubble(x,y,img) {
	this.x = x;
	this.y = y;
	this.col = color(255,100);
	 this.img = img

	
	this.display = function(){
		noStroke();
		fill(this.col);
		imageMode(CENTER);
		image(img, this.x,this.y,50,50);
	} 
	this.clicked = function(){
		var d = dist(this.x, this.y, mouseX, mouseY);
		if (d<24){
		this.col = color(255,154,65)	;
		}
	}
	
	this.move= function(){
		this.x = this.x + random(-1,1);
		this.y = this.y + random(-1,1);
	}
}