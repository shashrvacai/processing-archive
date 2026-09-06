var p;
var g =-400;
var rot =  0;
var ran;
function setup()  {
    background(51);
  createCanvas(1000,1000);
  ran = random(125,675);
  r = new Pendulum(createVector(width/2,0),ran);
  ran = random(125,675);
  p = new Pendulum(createVector(width/2,0),ran);
  ran = random(125,675);
  q = new Pendulum(createVector(width/2,0),ran);
  ran = random(125,675);
  s = new Pendulum(createVector(width/2,0),ran);
  ran = random(125,675);
  t = new Pendulum(createVector(width/2,0),ran);
  ran = random(125,675);
  u = new Pendulum(createVector(width/2,0),ran);
  ran = random(125,675);
  v = new Pendulum(createVector(width/2,0),ran);
  ran = random(125,675);
 w = new Pendulum(createVector(width/2,0),ran);
 ran = random(125,675);
  x = new Pendulum(createVector(width/2,0),ran);
  ran = random(125,675);
  y = new Pendulum(createVector(width/2,0),ran);
  ran = random(125,675);
  z = new Pendulum(createVector(width/2,0),ran);
  ran = random(125,675);
  a = new Pendulum(createVector(width/2,0),ran);
 

}

function draw() {
  rotate(PI/2);
  //rotate(rot*0.01);
    //scale(0.8);
    translate(g,-800);

  r.go();
  p.go();
  q.go();
   s.go();
  t.go();
  u.go();
   v.go();
  w.go();
  x.go();
   y.go();
  z.go();
  a.go();
   
  rot++;
  g++;
}

function mousePressed() {
  //p.clicked(mouseX,mouseY);
}

function mouseReleased() {
 
}