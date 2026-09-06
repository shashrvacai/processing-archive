var bubbles = [];
var img ;

function preload(){
  img = loadImage("image/glass.jpg")
}
function setup() {
  createCanvas(1000,1000);
}
function mousePressed(){
  var b = new Bubble(mouseX,mouseY);
  bubbles.push(b);
}
function draw() {
  background(0);
  for (var i = bubbles.length ; i>=0 ; i --){

    bubbles[i].display();
  }
}