function Mover(){
  this.vel =  createVector();
  this.acc = createVector();
  this.mass = 1;
  this.loc = createVector(random(width),random(height));
  
  this.applyForce = function(force){
    var f = p5.Vector.div(force,this.mass);
    this.acc.add(f);
  }
  
  this.update= function(){
    this.vel.add(this.acc);
    this.loc.add(this.loc);
    this.acc.mult(0);
  }
  
  this.show = function(){
    fill(255);
    ellipse(this.loc.x,this.loc.y,50,50);
  }
  this.checkEdges = function() {
    if (this.loc.x > width) {
      this.loc.x = width;
      this.vel.x *= -1;
    } else if (this.loc.x < 0) {
      this.vel.x *= -1;
      this.loc.x = 0;
    }
    if (this.loc.y > height) {
      this.vel.y *= -1;
      this.loc.y = height;
    }else if (this.loc.y < 0) {
      this.vel.y *= -1;
      this.loc.y = 0;
    }
  };
  
} 