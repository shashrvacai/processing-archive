var ropes = [];
var collisionSize;
var debugMode = false;

var gravitySlider;
var airDragSlider;
var elasticitySlider;
var thicknessSlider;
var collisionSizeSlider;
var debugButton;


function setup() {
  createCanvas(windowWidth, windowHeight);
  
  // // Create on-screen controls.
  gravitySlider = new SliderLayout("Gravity", -5, 5, 2, 0.1, 100, 100);
  airDragSlider = new SliderLayout("Air drag", 0.1, 0.5, 0.2, 0.1, 100, 170);
  elasticitySlider = new SliderLayout("Elasticity", 0.05, 0.3, 0.1, 0.01, 100, 240);
  thicknessSlider = new SliderLayout("Stroke thickness", 1, 4, 2, 0.1, 100, 310);
  collisionSizeSlider = new SliderLayout("Collision size", 50, 150, 100, 1, 100, 380);

  
  var ropeCount = 100;
  
  // Create a series of ropes along the scene's width.
  for (var i = 0; i < ropeCount; i++) {
    var x = map(i, 0, ropeCount, width/2-400, width/2+400);
    var y = height/4;

    var newRope = new Rope(x, y, 10);
    ropes.push(newRope);
  }
} 


function draw() {
  background(75);
  
  collisionSize = collisionSizeSlider.slider.value();
  
  // Display collision object.
  noStroke();
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, collisionSize, collisionSize);
  
  // React against collision object.
  for (var i = 0; i < ropes.length; i++) {
    for (var j = 0; j < ropes[i].objs.length; j++) {
      var d = dist(mouseX, mouseY, ropes[i].objs[j].pos.x, ropes[i].objs[j].pos.y);
      
      if (d < collisionSize) {
        // Push ball away from collision object.
        var force = new p5.Vector(ropes[i].objs[j].pos.x, ropes[i].objs[j].pos.y);
        force.sub(mouseX, mouseY);
        force.normalize();
        force.mult(2);
        ropes[i].objs[j].acc.add(force);
      }
    }
    
    ropes[i].display();
  }
  
}


