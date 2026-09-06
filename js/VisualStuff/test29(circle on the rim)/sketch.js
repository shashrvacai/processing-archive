var a = 0;
var inc = 0.005;
var ad = 10;

function setup() {
  createCanvas(600,600)
}

function draw() {
  background(0,10);
  fill(50,255,100);
  noStroke();
  
    translate(width/2,height/2);
    scale(2);
    rotate(a*0.02)
    var b = map (mouseX,0,width,0,TWO_PI);
    console.log(b)
      for(var i = 0 ; i<=360;i+=1){
          x = cos(a+(i*0.5))*260;
          rotate(b)
          
          ellipse(0,x,10,10);
      }
      
    a += inc;
}