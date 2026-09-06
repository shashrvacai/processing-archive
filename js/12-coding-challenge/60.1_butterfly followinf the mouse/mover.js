
function Mover() {
  this.position = createVector(random(width),random(height));   // random start 
  this.velocity = createVector();   
  this.acceleration = createVector();
  this.topspeed = 6;   // hover around the mouse

  this.update = function() {
    
    var mouse = createVector(mouseX,mouseY);  // collecting mouse in a vector
    this.acceleration = p5.Vector.sub(mouse,this.position);
    // Set magnitude of acceleration
    this.acceleration.setMag(0.2);     // this can be edited from topSpeed

    this.velocity.add(this.acceleration);    // physics acceleration
    this.velocity.limit(this.topspeed); 
    this.position.add(this.velocity);
  };

  this.display = function() {
    noStroke();
    fill(10,205,250);
    //ellipse(this.position.x, this.position.y, 48, 48);
    this.butterfly();
  };
  
  this.butterfly = function(){
  	
		  	this.da = PI/300;
		 		this.dx = 0.01;
		 		this.fc = random(0.35,0.45);
		 	
		  beginShape();
		  this.xoff = 0;
		  for(var a = -PI/2; a <= PI/2; a+= this.da){
		  	this.n = noise(this.xoff,this.yoff);
		  	this.r = sin(2*a)*map(this.n,0,1,5,10);
		  	this.xoff += this.dx;
		  	this.x= this.r *cos(a);
		  	this.y = sin(frameCount*this.fc)*this.r* sin(a);
		  	vertex(this.x+this.position.x,this.y+this.position.y);
		  }
		  for(var a = PI/2; a <= 3*PI/2; a+= this.da){
		  	this.n = noise(this.xoff,this.yoff);
		  	this.r = sin(2*a)*map(this.n,0,1,5,10);
		  	this.x= this.r *cos(a);
		  	this.y = sin(frameCount*this.fc)* this.r* sin(a);
		  	this.xoff -= this.dx;
		  	vertex(this.x+this.position.x,this.y+this.position.y);
		  }
		  endShape();
  }
}