function Pipe() {
  this.t = random(height-300);   // height of top
  this.b = random(height/2);   // height of bottom
  this.gap = 180 ;   // gap between the pipes
  this.x = width;   
  this.w = 20;   // width of the pipes 
  this.speed =  speed;   //speed of the game

  this.HL = false;

  this.hits = function(bird) {
    if (bird.y < this.t || bird.y > this.t+this.gap ) {
      if (bird.x > this.x && bird.x < this.x + this.w) {
        this.HL = true;
        return true;
      }
    }
    if(this.HL === false && this.x == bird.x){
      Sc += 1;
    }
    
    this.HL = false;
    return false;
  }



  this.show = function() {
    fill(255);
    if (this.HL) {
      fill(255, 0, 0);
    }
    rect(this.x, 0, this.w, this.t);
    rect(this.x, this.t+this.gap   , this.w, height);
  }

  this.update = function() {
    this.x -= this.speed;
  }

  this.offscreen = function() {
    if (this.x < -this.w) {
      return true;
    } else {
      return false;
    }
  }


}