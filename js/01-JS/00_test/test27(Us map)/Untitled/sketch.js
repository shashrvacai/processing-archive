var system;
var lat1;
var long1;
var lat2;
var long2 ;

function preload() {
	citi = loadTable("cities.csv", "header");
}

function setup() {
  createCanvas(720, 400);
  	for (var i = 0; i < citi.getRowCount(); i++) {
  			lat1 = citi.getNum(i, "lat");
				long1 = citi.getNum(i, "lng");
  system = new ParticleSystem(createVector(lat1, long1));
  	}
}

function draw() {
	translate(-500, -450)
	scale(5);
  background(0);
	for (var i = 0; i < citi.getRowCount(); i++) {
		if (i < citi.getRowCount() - 1) {
			lat1 = citi.getNum(i, "lat");
			long1 = citi.getNum(i, "lng");
			lat2 = citi.getNum(i + 1, "lat");
			long2 = citi.getNum(i + 1, "lng");
			drawLine();
		}

	}
  system.addParticle();
  system.run(lat1,long1);
}

function setXY(lat1, long1, lat2, long2) {
	var x1 = map(long1, -180, 180, 0, width);
	var y1 = map(lat1, 90, -90, 0, height);
	var x2 = map(long2, -180, 180, 0, width);
	var y2 = map(lat2, 90, -90, 0, height);
	line(x1, y1, x2, y2);
}

function drawLine() {
	setXY(lat1, long1, lat2, long2);
}

// A simple Particle class
var Particle = function(position) {
  this.acceleration = createVector(0, 0.05);
  this.velocity = createVector(random(-1, 1), random(-1, 0));
  this.position = position.copy();
  this.lifespan = 255.0;
};

Particle.prototype.run = function(a,b) {
  this.update();
  this.display(a,b);
};


Particle.prototype.update = function(){
  this.velocity.add(this.acceleration);
  this.position.add(this.velocity);
  this.lifespan -= 2;
};

// Method to display
Particle.prototype.display = function(a,b) {
  stroke(200, this.lifespan);
  strokeWeight(0.2);
  fill(127, this.lifespan);
  line(this.position.x, this.position.y, a, b);
};

// Is the particle still useful?
Particle.prototype.isDead = function(){
  if (this.lifespan < 0) {
    return true;
  } else {
    return false;
  }
};

var ParticleSystem = function(position) {
  this.origin = position.copy();
  this.particles = [];
};

ParticleSystem.prototype.addParticle = function() {
  this.particles.push(new Particle(this.origin));
};

ParticleSystem.prototype.run = function() {
  for (var i = this.particles.length-1; i >= 0; i--) {
    var p = this.particles[i];
    p.run();
    if (p.isDead()) {
      this.particles.splice(i, 1);
    }
  }
};