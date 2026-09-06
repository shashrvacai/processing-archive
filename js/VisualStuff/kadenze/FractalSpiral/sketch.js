var cD ; // circle Diameter 
var A = 0;
  
function setup() {
  createCanvas(1000,1000)
  cD = width - width/6
}

function draw() {
  translate(width/2,height/2)
    background(0,5)
    
    noFill()
    stroke(255)
    //strokeWeight(0.1)
    //ellipse(0,0,cD,cD)
    strokeWeight(1)
    dLines(cD);
  A+=0.005;
}

function mousePressed(){
  background(0);
}

function dLines(c){
  rotate(A)
  line(0,c/2,c/2,0)
    push()
      rotate(PI/2+A);
      line(0,c/2,c/2,0)
      push()
        rotate(PI/2+A);
        line(0,c/2,c/2,0)
        push()
          rotate(PI/2+A);
          line(0,c/2,c/2,0)
        pop()
      pop()
    pop()
    
    if(c > 10){
      dLines(c - c/3)
    }
}