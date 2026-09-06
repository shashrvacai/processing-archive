var slider;
var R= 0;

function setup() {
  createCanvas(600,600);
  slider = createSlider(-20,20,2,0.1)
  
}

function draw() {
  background(51,25);
  translate(width/2, height/2);
  rotate(R)
  stroke(255);
  
  var a = 100;
  var b = 100;
  var n = slider.value();
  noFill();
  beginShape();
  for (var an = 0 ; an <=TWO_PI;an+=0.1){
    //var x = r *cos(a);
    //var y = r *sin(a);
    var na = 2/n;
    var x =pow(abs(cos(an)),na)*a*sgn(cos(an));
    var y =pow(abs(sin(an)),na)*a*sgn(sin(an));
    
    vertex(x,y);
  }
  endShape(CLOSE);
  R+=0.01;
}

function sgn(val){
  if(val >0 ){
    return 1;
  }else if(val <0){
    return -1 ;
  }else {
    return 0;
  }
}