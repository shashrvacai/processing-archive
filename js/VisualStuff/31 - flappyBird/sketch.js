var bird;
var pipes = [];
var Sc = 0 ;  //Score
var speed = 3;
var disPipes = 100;

function setup() {
  createCanvas(400, 600);
  bird = new Bird();
  pipes.push(new Pipe());
  //createP('Score'+ );
}

function draw() {
  background(0);
  stroke(255)
  text(Sc,50,50);
  for (var i = pipes.length-1; i >= 0; i--) {
    pipes[i].show();
    pipes[i].update();
   (pipes[i].hits(bird))
  
    if (pipes[i].offscreen()) {
      pipes.splice(i, 1);
    }
    if (frameCount % 1440 === 0) {            
       speed += 0.5;
       disPipes -=10
    }
  }
  bird.update();
  bird.show();

  if (frameCount % disPipes === 0) {             // frequency of pipes 
    pipes.push(new Pipe());
  }
  console.log(frameCount)
}

function keyPressed() {
  if (key == ' ') {
    bird.up();
  }
}