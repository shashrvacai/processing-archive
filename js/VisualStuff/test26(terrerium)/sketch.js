

var yoff = 0;

function setup() {
  createCanvas(800, 800);
}

function draw() {
  background(51);
  
  noStroke();
  translate(width/2, height/3+height/3);
  fill(200,100,0);
  Flame();
  rotate(PI);
  //Flame();
  
}

function Flame(){
  
  this.da = PI / 300;   // map worthy     resolution
  this.dx = 0.07;     // noise value  how sharp the edges will be. 
  this.xoff = 0;     
 
 this.render = function(){
      beginShape();
      for (var a = -PI / 2; a <= 12 * PI ; a += this.da) {
        this.n = noise(this.xoff, this.yoff);
        this.r = sin(-1 * a) * map(this.n, 0, 1, 50, 600);  // scale 
        this.x = r * cos(a);
        this.y = r * sin(a);
        if (a < PI / 2){
            this.xoff += this.dx; 
        } else{
            this.xoff -= this.dx; 
        }
        vertex(this.x, this.y);
      }
      endShape();

  this.yoff += 0.03;
 }
 this.render();
}

