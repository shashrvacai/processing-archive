var k = -3;     // creates Variation in the benice curve

function Orbit(x_, y_, r_, n, p) {
  
  this.x = x_;
  this.y = y_;
  this.r = r_;
  this.parent = p;
  this.child = null;
  this.speed = (radians(pow(k, n-1)))/resolution;
  this.angle = -PI/2;

  this.addChild = function() {
    var newr = this.r / 3.0;
    var newx = this.x + this.r + newr;
    var newy = this.y;
    this.child = new Orbit(newx, newy, newr, n+1, this);
    return this.child;
  }

  this.update = function() {
    var parent = this.parent;
    if (parent != null) {
      this.angle += this.speed;
      var rsum = this.r + parent.r;            // if you change this +  to - it will create inCircles
      this.x = parent.x + rsum * cos(this.angle);
      this.y = parent.y + rsum * sin(this.angle);
    }
  }

  this.show = function() {
    this.R = map(mouseX,0,width,0,255);            // mapping R and G value
    this.g = map(mouseY,0,height,0,255);
   
    stroke(this.g,0,this.R,45);          // color of the circle
    strokeWeight(1);
    noFill();
    ellipse(this.x, this.y, this.r*2, this.r*2);
  }
}