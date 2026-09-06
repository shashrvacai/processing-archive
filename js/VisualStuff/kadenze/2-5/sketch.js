var p1 ;
var p2 ;

function setup() {
  createCanvas(600,600);
  p1 = new Particle(100,200);
  p2 = new Particle(200,300);
}

function draw() {
  background(31);
  var g = createVector(random(0.5,-0.5),random(-0.5,0.5));
  var w = createVector(random(3,-3),random(-3,3));
  
  p1.applyForce(g) ; p2.applyForce(g);
  if (mouseIsPressed){
    p1.applyForce(w) ; p2.applyForce(w);
  }
  
  p1.update() ; p2.update();
  p1.show() ; p2.show();
  p1.edges() ; p2.edges();
  
}

