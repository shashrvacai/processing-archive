var buz;  //  moving object
var A =0 ; // inc counter

function setup() {
  createCanvas(600,600)
  buz = new Buzzer();  // creates a new buzzer
}

function draw() {
  background(0,10)
  buz.fly();  // function to move
  buz.show();  // looks of the buzzer
  A ++;
}

function Buzzer(){
  this.pos = createVector(random(width),random(height))    // 3 vel, pos  and acc (will update the consolidate verson later) 
  this.vel = createVector(0,0);
  this.pos1 = createVector(random(width),random(height))
  this.vel1 = createVector(0,0);
  this.pos2 = createVector(random(width),random(height))
  this.vel2 = createVector(0,0);
  
  this.fly = function(){
    var mouse =  createVector(mouseX,mouseY)
    this.acc = p5.Vector.sub(mouse, this.pos)
    this.acc.setMag(0.3);                           // diff magnitude for different vectors
    this.acc1 = p5.Vector.sub(mouse, this.pos1)
    this.acc1.setMag(0.2);
    this.acc2 = p5.Vector.sub(mouse, this.pos2)
    this.acc2.setMag(0.5);
    
    
    this.pos.add(this.vel);   // 3 simple engines 
    this.vel.add(this.acc);
    this.pos1.add(this.vel1);
    this.vel1.add(this.acc1);
    this.pos2.add(this.vel2);
    this.vel2.add(this.acc2);
    this.vel.setMag(5);
  }
  
  
  this.show = function(){
    stroke(0)
    fill(255)
    ellipse(this.pos.x-25,this.pos.y,random(75),50)
    ellipse(this.pos.x+25,this.pos.y,random(75),50)
    
    fill(134,256,41);
    ellipse(this.pos1.x-10,this.pos1.y,random(25),10)
    ellipse(this.pos1.x+10,this.pos1.y,random(25),10)
    fill(134,41,256);
    ellipse(this.pos2.x,this.pos2.y,25,25)
  }
}