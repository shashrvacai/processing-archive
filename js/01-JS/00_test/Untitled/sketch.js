var numBalls = 5;
var spring = 0.1;
var gravity = 0.03;
var friction = -0.9;
var balls = [];

function setup() {
    createCanvas(windowWidth, windowHeight);
    for (var i = 0; i < numBalls; i++) {
        balls[i] = new Ball(random(100,50), i, balls);
    }
    noStroke();
    fill(255, 204);
    // noLoop();
}

 function mousePressed(){
	for (var i = 0 ; i < balls.length; i++){
  	balls[i].click();
  	window.location = 'https://www.google.com/'
  }
}
function draw() {
    background(0);
    for (var i = 0; i < balls.length; i++) {
    	for (var j = 0; j < balls.length; j++) {
				if (i !== j) {
						var force = balls[j].CalForce(balls[i]);
						balls[i].applyForce(force);
				}
    	}
        balls[i].collide();
        balls[i].move();
        balls[i].display();
    }
}

