function Rope(x, y, count) {
  
  this.objs = [];
  
  this.objs.push(new Spring(x, y, 1));

  for (var i = 0; i < count; i++) {
    this.objs.push(new Pendulum(x, y+i*15, this.objs[this.objs.length-1]))
  }
  
  this.display = function() {
    noFill();
    stroke(0);
    strokeWeight(thicknessSlider.slider.value());
    
    beginShape();
    curveVertex(this.objs[0].pos.x, this.objs[0].pos.y);
    
    for (var i = 0; i < this.objs.length; i++) {
      this.objs[i].move();
      

        curveVertex(this.objs[i].pos.x, this.objs[i].pos.y);
      
    }
    
    curveVertex(this.objs[this.objs.length-1].pos.x, this.objs[this.objs.length-1].pos.y);
    endShape();
  }
}