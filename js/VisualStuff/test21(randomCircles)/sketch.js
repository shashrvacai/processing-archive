var w ;


function setup() {
  createCanvas(800,800);
  w = new Walker();
  background(0);
}

function draw() {
  w.step();
  w.render();
  
}

