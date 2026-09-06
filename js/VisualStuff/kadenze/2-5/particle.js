function Particle(x,y){
  this.pos = createVector(x,y);
  this.vel = createVector(0,0);
  this.acc = createVector(0,0);
  this.mass = 1
  
  this.applyForce = function(force){
    var f = force.copy();
    f.div(this.mass)
    this.acc.add(f);
  }
  
  this.update = function(){
    this.vel.add(this.acc);
    this.pos.add(this.vel);
    this.acc.set(0,0);
  }
  
  this.show = function(){
    ellipse(this.pos.x, this.pos.y , 50,50)
  }
  
  this.edges = function(){
    if(this.pos.y>height){
      this.vel.y *= -1;
      this.pos.y = height
    }else if(this.pos.y<0){
      this.vel.y *= -1;
      this.pos.y = 0
    }else if(this.pos.x<0){
      this.vel.x *= -1;
      this.pos.x = 0
    }else if(this.pos.x>width){
      this.vel.x *= -1;
      this.pos.x = width;
    }
    
    
  }
}