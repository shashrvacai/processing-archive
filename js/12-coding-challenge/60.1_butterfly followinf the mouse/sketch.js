var movers = [];  // making movers an array
var thibbi;

function setup() {
  createCanvas(640,360);  
  for (var i = 0; i < 20; i++) {    // number of butterflies 
     movers[i] = new Mover();   
  }
  thibbi = loadImage("shibi.png");
}

function draw() {
	
  background(255,220,220);   
	image(thibbi, mouseX-50,mouseY-50,100,100);
  for (var i = 0; i < movers.length; i++) { 
    movers[i].update();
    movers[i].display(); 
    
  }
  
 
}