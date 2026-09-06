var E =0.05;

function Bubble(x,y){
  this.x = x;
  this.y = y;
  this.r = 5;
  this.col=color(255);
  this.tx = 0; this.ty = 0; this.dx = 0; this.dy = 0;
  this.life = 255;
  
  this.changeColor= function(){   //-- changeColor
    this.col = color(random(255),random(255),random(255));
  }
  
  this.intersects = function(other){    //  --- intersection
    var d =  dist(this.x,this.y,other.x,other.y);
    if (d < this.r +other.r){
      return true
    } else {
      return false;
    }
  }
  
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