
function Pipe() {
  this.top = random(100,height-100);
  this.bottom = random(height/2);
  this.u = 100;  // distance between the pipes
  this.x = width;
  this.w = 20;
  this.speed = 2;

  this.highlight = false;

  this.hits = function(bird) {
    if (bird.y < this.top || bird.y > this.top+this.u) {
      if (bird.x > this.x && bird.x < this.x + this.w) {
        this.highlight = true;
        var o = (this.w*4) * sin(A)+ bird.x;
        var p = (this.w*4) * cos(A)+ bird.y;
        fill(0,0,255)
        ellipse(o , p , this.w ,this.w)
        ellipse( p ,o , this.w ,this.w)
        return true;
      }
    }
    this.highlight = false;
    return false;
  }

  this.show = function() {
    fill(255);
    if (this.highlight) {
      background(255, 0, 0);
    }
    rect(this.x, 0, this.w, this.top);
    rect(this.x, this.top +this.u , this.w, height);
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
