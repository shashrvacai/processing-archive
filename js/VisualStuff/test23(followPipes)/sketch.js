var bubbles = [];

function setup() {
  createCanvas(1000, 1000);
  CreateB();
  background(0);
}

function draw() {
  background(0,1);
  for (var i = 0; i < bubbles.length; i++) {
    bubbles[i].update();
    bubbles[i].display();
    if(bubbles[i].r>50){
      bubbles.splice(i,1);
    }
  }
}

function mousePressed(){
  //CreateB();
  var x1 = randomGaussian(width/2,100);
  var y1 = randomGaussian(height/2,100);
  for (var i = 0; i<4; i++){
    var b = new Bubble(x1,y1);
    x1*i;
    y1*i;
    bubbles.push(b);  
  }
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