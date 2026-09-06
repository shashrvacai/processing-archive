var mover ;
var attractor ;

function setup() {
  createCanvas(600,600);
  mover = new Mover();
  attractor = new Attractor();
}

function draw() {
  background(140);
  
  var farce = attractor.calAtt(mover);
  mover.applyForce();
  mover.update();
  mover.show();
  mover.checkEdges();
  attractor.show();
}