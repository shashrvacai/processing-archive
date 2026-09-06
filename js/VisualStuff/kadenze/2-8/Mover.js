function Mover(x,y,m){ 
  this.pos = createVector(x,y);  // pos, vel, acc vectors
  this.vel = createVector(0,0);
  this.acc = createVector(0,0);
  this.m =m 
  
  this.applyForce = function(force){   // function to pass force
    var f = p5.Vector.div(force,this.m)
    this.acc.add(f)
  }
  
  this.update = function(){   // simple physics engine
    this.vel.add(this.acc)
    this.pos.add(this.vel)
    this.acc.mult(0);
  }
  
  this.show = function(){   // display of the movers
    fill(70,10,108,150);
    ellipseMode(CENTER);
    ellipse(this.pos.x, this.pos.y, this.m*10, this.m*10);
    noStroke()
    fill(255,150);
    ellipse(this.pos.x + (this.m*5)/2,this.pos.y+ (this.m*5)/2,this.m*2.5,this.m*2.5)
  }
  
  this.edges= function(){    // bounce of the edges
    if(this.pos.x>width){
      this.pos.x = width;
      this.vel.x *= -1
    } else if(this.pos.x<0){
      this.pos.x = 0;
      this.vel.x *= -1
    }else if(this.pos.y>height){
      this.pos.y = height;
      this.vel.y *= -1
    } else if(this.pos.y<0){
      this.pos.y = 0 ;
      this.vel.y *= -1
    }
    
  }
}