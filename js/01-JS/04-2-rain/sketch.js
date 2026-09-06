var drops = [];
var canvas;

function windowResized(){
	resizeCanvas(windowWidth,windowHeight);
}
function setup() {
  canvas= createCanvas(windowWidth,windowHeight);
  canvas.position(0,0);
  canvas.style('z-index','-1');
  
  for (var i = 0; i < 50; i ++){         // number of circles
    drops[i] = new Drop();
  }
}

function draw() {
	
  background(0,50);           // trail
  for (var i = 0; i < drops.length; i ++){
    drops[i].fall();
    drops[i].show();
  }
}

function Drop(){
  this.x = random(width);
  this.y = random(-100,-700);
  this.z = random(0,20);
  this.ySpeed = map(this.z,0,20,0.2,5);         // downward speed range   
  this.xSpeed = map(this.z,0,20,-6,16);          // side ward speed range 
  this.len =  map(this.z,0,20,2,10);
  this.col =  map(this.z,0,20,255,0);
  
  this.fall = function(){
  	this.x = this.x + random(-5,5); //+this.xSpeed ;
  	if(this.x > width){
      this.x = random(-100,-20);
    }else if (this.x > width){
      this.x = random(-100,-20);
    }
    
    this.y = this.y +this.ySpeed ;
    if(this.y > height){
      this.y = random(-100,-700);
    }
  }
  
  this.show = function(){
    noStroke();
    //stroke(this.col,this.col,255-this.col,255-this.col);
    fill(100,150,15);             // drop colors
    this.thick =  map(this.z,0,20,0.1,3);  
    strokeWeight(2);
    //noFill();
    ellipse(this.x, this.y , 70,70);
   line(this.x, this.y , this.x+ this.len,this.y );
  }
  
  
}

