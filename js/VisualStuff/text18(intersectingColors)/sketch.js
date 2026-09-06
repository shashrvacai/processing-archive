var bubbles = [];

function setup() {
  createCanvas(1000, 1000);
  CreateB();
}

function draw() {
  background(0,10);
  for (var i = 0; i < bubbles.length; i++) {
    bubbles[i].update();
    bubbles[i].display();
    if(bubbles[i].life<0){
      bubbles.splice(i,1);
    }
  }
}

function mousePressed(){
  CreateB();
  
}

function CreateB(){
  for (var i = 0; i <50; i++) {
    bubbles[i] = new Bubble(random(width), random(height));
  }
}
/*
for (var j = 0; j < bubbles.length; j++) {
      if (i != j && bubbles[i].intersects(bubbles[j])) {
        bubbles[i].changeColor();
        bubbles[j].changeColor();
      }
    }   
*/