function setup() {
  
}

function draw() {
  
}//color palette from https://klart.co/colors/59c774786fb55d3948befd3b
let colors = ["#246A9E","#8BB3C8","#9E5C71","#FC9C78","#F1F2F9"];
let mainDiam = 700;
let onlyInsideCircle = true;
let drawFirstCircle = false;
let fades = false;

function setup() {
  createCanvas(1000, 1000);
  strokeWeight(1);
  noFill();
}

function draw(){
  background(0,50);
  translate(width/2,height/2);
  iter=frameCount%500;
  doIt(0,0,0,mainDiam);
  if(fades){
    if(iter < 550){
      background(0,255-255*(iter/250));
    } else {
      background(0,255-255*((500-iter)/250));
    }
  }
}

function doIt(c, x, y, d){
	
  f=sin((iter)*0.00001);
  //x=x+noise(x*0.010)*50;
 	y=y+noise(x*0.010)*50;
  y=y+sin((x)*f*50);
  x=x+cos((y)*f)*50;
  
  stroke(colors[c=(c+1)%colors.length]);
  if(!onlyInsideCircle || dist(0,0,x,y)+d*0.3<mainDiam/2){
    if(d < mainDiam || drawFirstCircle){
      ellipse(x,y,d);
    }
  }
  if(d > 2){
    doIt(c, x-d*0.5,y,d*0.5);
    doIt(c, x+d*0.5,y,d*0.5);
  }
}