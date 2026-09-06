var circle = 10;
var rot;
var col;
var freq = 0.000005; 
var cont = 0;
var r;

function setup() {
  createCanvas(windowWidth,windowHeight);
}

function draw() {
  background(242,5);
  translate(width/2, height/2);
  rotate(radians(rot));

 ellipseMode(RADIUS);
  for (var i=0; i<500; i ++) {
    circle= 200 + 150*sin(millis()/1*freq*i);
    col=map(circle,150,250,255,60);
    r=5;
    fill(col,0,74);
    noStroke();
    ellipse(circle*cos(i), circle*sin(i),r,r);    
    rot=rot+0.00005;
  }
}