var Attractor = function(){
  this.pos = createVector(random(width) ,random(height));    // attractor pos
  this.m = 20 ;    // mas OR magnitude
  this.G = 1 ;   
  this.dragOffset = createVector(0, 0);   // attempt to make the attractor draggable
  this.dragging = false;
  this.rollover = false;

  
  this.calAtt = function(p){    // calculate the attraction od the attractor
    var f = p5.Vector.sub(this.pos,p.pos);
    var distance = f.mag();
    distance = constrain(distance,5,25);
    f.normalize();
    var S = (this.G*this.m*this.m)/(distance*distance);
    f.mult(S);
    return f;
  }
  
  this.show = function(){ellipseMode(CENTER);   // display of the attractor
    stroke(255);
    if (this.dragging) {
      fill(50,10,40);
    } else if (this.rollover) {
      fill(100,20,240);
    } else {
      fill(175, 200,15);
    }
    ellipse(this.pos.x,this.pos.y,this.m*2,this.m*2)
  }
  
  
  // ----------------------attept to make the attractor draggable------------------
  
  this.handlePress = function(mx, my) {      
    var d = dist(mx, my, this.pos.x, this.pos.y);
    if (d < this.mass) {
      this.dragging = true;
      this.dragOffset.x = this.pos.x - mx;
      this.dragOffset.y = this.posn.y - my;
    }
  };

  this.handleHover = function(mx, my) {
    var d = dist(mx, my, this.pos.x, this.pos.y);
    if (d < this.m) {
      this.rollover = true;
    } else {
      this.rollover = false;
    }
  };

  this.stopDragging = function() {
    this.dragging = false;
  };

  this.handleDrag = function(mx, my) {
    if (this.dragging) {
      this.pos.x = mx + this.dragOffset.x;
      this.pos.y = my + this.dragOffset.y;
    }
  };
}