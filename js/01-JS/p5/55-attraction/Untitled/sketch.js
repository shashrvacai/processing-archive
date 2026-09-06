var attractors = [];
var particles = [];

function setup() {
  createCanvas(1000, 1000);
}

function mousePressed() {
  attractors.push(createVector(mouseX, mouseY));
  background(51);
  //rotate(90);
}

function draw() {
  background(51,5);
  stroke(255,255,0);
  
  
  for (var v = 50; v < width ; v+= 100){
  particles.push(new Particle(v,random(150,650)));  
  
}
   var m = map(mouseY, 0,height,0,100);
  if ((particles.length > 20)||(particles.count>500)) {
    particles.splice(m);
  }

  for (var i = 0; i < attractors.length; i++) {
    stroke(10, 25,200);
    point(attractors[i].x, attractors[i].y);
  }
  for (var i = 0; i < particles.length; i++) {
    var particle = particles[i];
    for (var j = 0; j < attractors.length; j++) {
      particle.attracted(attractors[j]);
    }
    particle.update();
    particle.show();
  }

}