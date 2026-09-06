// Using this variable to decide whether to draw all the stuff
var debug = true;

// Flowfield object
var flowfield;
// An ArrayList of vehicles
var vehicles = [];

function setup() {

  createCanvas(windowWidth,windowHeight);
  flowfield = new FlowField(3);  // the GRID
  
  for (var i = 0; i < 1500; i++) {
    vehicles.push(new Vehicle(random(width), random(height), random(2, 5), random(-0.5, -12.5)));
  }
}

function draw() {
  background(0,10);
  textSize(30)
  noStroke()
    fill(255)
  textAlign(CENTER)
 // text("follow ",width/2,height/2)
  //text("the grid ",width/2,height/2+30)
  
  // Display the flowfield in "debug" mode
  //if (debug) flowfield.display();
  // Tell all the vehicles to follow the flow field
  var mo = createVector(mouseX, mouseY)
  for (var i = 0; i < vehicles.length; i++) {
    vehicles[i].follow(flowfield);
   //vehicles[i].applyForce(mo)
    vehicles[i].run();
  }
  push()
     // rect(width/4,height/3, 100,200);
    pop()
}


function keyPressed() {
  if (key == ' ') {
    debug = !debug;
  }
}

// Make a new flowfield
function mousePressed() {
  flowfield.init();
}