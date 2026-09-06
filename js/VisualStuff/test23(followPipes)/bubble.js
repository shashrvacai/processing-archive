var E =0.05;

function Bubble(x,y){
  this.x = x;
  this.y = y;
  this.r = 1;
  this.col=color(255);
  this.tx = 0; this.ty = 0; this.dx = 0; this.dy = 0;
  this.life = 255;


  this.display = function(){   // ---- display 
    noStroke();
    fill(this.col, this.life);
    ellipse(this.x,this.y,this.r,this.r);
    this.r++;
    this.life -=2;
  }
  this.update = function(){    /// ------ follow through
    this.tx = mouseX;
    this.ty = mouseY;
    this.dx = this.tx- this.x;
    this.dy = this.ty - this.y;
    this.x = this.x + this.dx * E;
    this.y = this.y + this.dy * E;
  }
}