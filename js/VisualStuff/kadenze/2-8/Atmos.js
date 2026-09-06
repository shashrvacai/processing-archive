function Atmos(x,y,c,col){
  this.pos = createVector(x,y)
  this.c= c ;
  this.w = random(0,width)
  this.h = random(50,100)
  this.col = col
  
  this.contains = function(m){    // function to see if the mover is inside the field
    var l = m.pos;
    return l.x > this.pos.x && l.x < this.pos.x + this.w &&
           l.y > this.pos.y && l.y < this.pos.y + this.h;
  }
  
  this.calDrag = function(m){   // cal the drag withe the give parameter 
    var S = m.vel.mag();
    var dMag = this.c*S*S;
    var dForce = m.vel.copy();
    dForce.mult(-1);
    dForce.setMag(dMag);
    return dForce;
  }
  
  this.show = function(){  // display function for the field
    noStroke()
    fill(this.col)
    rect(this.pos.x, this.pos.y, this.w,this.h)
  }
}