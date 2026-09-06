function Attractor(){
  this.pos = createVector(random(width),random(height));
  this.mass = 20 ;
  
  this.G =1;
  
  this.calAtt = function(m){
    var force = p5.Vector.div(this.pos,m.loc);
    var D = force.mag();
    D = constrain(D,5,25);
    force.normalize();
    var S = (this.G*this.mass*m.mass)/(D*D);
    force.mult(S);
    return force;
  }
  
  this.show = function(){
    fill(145);
    ellipse(CENTER);
    ellipse(this.pos.x,this.pos.y,this.mass*2,this.mass*2);
  }
}