function Snake(){
	this.x = width/2;
	this.y = height/2;
	this.xspeed = 1;    
	this.yspeed = 0;
	this.total = 0;
	this.tail = [];
	
	this.death = function(){
		for(var i =0; i <this.tail.length; i++){
			var pos= this.tail[i];
			var d = dist(this.x, this.y, pos.x,pos.y);
			if(d<1){
				this.total= 0;
				this.tail =[];
				}
		}
		
				if(this.tail.length>3){
					frameRate(15);
				}else if(this.tail.length>6){
					frameRate(20);
				}else if(this.tail.length>9){
					frameRate(25);
				}else if(this.tail.length>12){
					frameRate(30);
				}else if(this.tail.length>15){
					frameRate(35);
				}else if(this.tail.length>18){
					frameRate(40);
				}else if(this.tail.length>21){
					frameRate(45);
				}else if(this.tail.length===0){
					frameRate(10);
				} 
	}
	
	this.update = function(){
		if (this.total=== this.tail.length){
			for(var i =0; i < this.tail.length-1; i++){
			this.tail[i]= this.tail[i+1];
			}
		}
		this.tail[this.total-1] = createVector(this.x, this.y);
		
		this.x = this.x +this.xspeed*Sc;
		this.y = this.y + this.yspeed*Sc;   
		this.x = constrain(this.x,0, width);
		this.y = constrain(this.y,0,height);
	}
	
	this.dir = function(x,y){   // take x y values from the key codes. 
		this.xspeed = x;
		this.yspeed = y;
		
	}
	
	this.eat = function(pos){
		var d = dist(this.x,this.y,pos.x,pos.y);
		if(d <1){
			this.total++;
			return true;
		}else {
			return false;
		}
		
	}
	
	this.show = function(){
		for(var i= 0; i < this.tail.length ; i++){
			ellipse(this.tail[i].x,this.tail[i].y,Sc,Sc)
		}
		fill(255);
		ellipse(this.x, this.y, Sc,Sc);
	}
}