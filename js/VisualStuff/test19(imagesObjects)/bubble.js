function Bubble(x, y) {
  this.x = x;
  this.y = y;
  
  this.display= function() {
    stroke(0);
    fill(255);
    image(img,this.x,this.y);
  }
  
  this.update =  function(){
    this.x = this.x + random(-1,1);
    this.y = this.y + random(-1,1);
  }
}