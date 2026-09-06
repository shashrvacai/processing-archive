var d = 10;
var n = 5;
var sliderD;
var sliderN;
var R = 0 ;


function setup() {
  createCanvas(600, 600);
  sliderD = createSlider(1, 20, 10, 1);
  sliderN = createSlider(1, 20, 10, 1);
  sliderD.input(draw);
  sliderN.input(draw);
  background(250,100,140);       // BG in the beginning
}

function draw() {
  var Rad =  width/2;
  
  d = sliderD.value();
  n = sliderN.value();
  var k = n / d;
  background(10,30,40,10);  // BG repeated
  
  push();
      translate(width / 2, height / 2);
      rotate(R);
          beginShape();
          stroke(10,255,250);   // border color
          noFill();
          strokeWeight(1);
          for (var a = 0; a < TWO_PI * reduceDenominator(n, d); a += 0.02) {
            var r = Rad * cos(k * a);
            var x = r * cos(a);
            var y = r * sin(a);
            vertex(x, y);
          }
          endShape(CLOSE);
      R+= 0.05;                 // speed of rotation
  pop();
}

function mouseClicked(){
  background(75,10);
}

function reduceDenominator(numerator, denominator) {
    function rec(a, b) {
        return b ? rec(b, a % b) : a;
    }
    return denominator / rec(numerator, denominator);
}