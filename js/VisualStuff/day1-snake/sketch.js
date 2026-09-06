var s ;
var Sc=  10;
var food;

function setup() {
  createCanvas(600,600);
  s = new Snake();
  frameRate(10);
  food = pickLocation();
}
function pickLocation(){
  var cols = floor(width/Sc);
  var rows = floor(height/Sc);
  food = createVector(floor(random(width)),floor(random(height)));
  food.mult(Sc);
}
function draw() {
  background(0);
  s.update();
  s.show();
  if(s.eat(food)){
    pickLoction();
    
  }
  fill(100);
  rect(food.x,food.y,Sc,Sc);
}

function keyPressed(){
  if (keyCode === UP_ARROW){
    s.dir(0,-1);
  } else if (keyCode === DOWN_ARROW){
    s.dir(0,1);
  } else if (keyCode === RIGHT_ARROW){
    s.dir(1,0);
  } else if (keyCode === LEFT_ARROW){
    s.dir(-1,0);
  } 
}

