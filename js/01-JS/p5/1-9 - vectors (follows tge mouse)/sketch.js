var movers = [];

function setup() {
  createCanvas(1500,1000);
  for (var i = 0; i < 10; i++) {
     movers[i] = new Mover(); 
     background(151,12,215);
  }
}

function draw() {

  for (var i = 0; i < movers.length; i++) {
    //var j = random(0,255);
    movers[i].update();
    movers[i].display(); 
   // al += 0.1; 
  } 
}

function mousePressed(){
	background(151,12,215);
}