function Mover() {
  this.position = createVector(random(width),random(height));
  this.velocity = createVector();
  this.acceleration = createVector();
  this.topspeed = 20;

  this.update = function() {
    // Compute a vector that points from position to mouse
    var mouse = createVector(mouseX,mouseY);
    this.acceleration = p5.Vector.sub(mouse,this.position);
    // Set magnitude of acceleration
    this.acceleration.setMag(2);

    this.velocity.add(this.acceleration);
    this.velocity.limit(this.topspeed);
    this.position.add(this.velocity);
  };


  
  this.display = function() {
  
    //var Ss = map(this.velocity,-1,1,0,50);
    strokeWeight(2);
      stroke(0);
     fill(151,40);
    ellipse(this.position.x, this.position.y, 36,36);
    //strokeWeight(2);
    //stroke(0);
      noStroke();
     fill(255);
   ellipse(this.position.x+10, this.position.y-10, 6,6);
    
  };

  
}