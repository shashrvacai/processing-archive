var s = 200;
var DP = 1;
var Dp = 801;
var center;
var img;

function preload() {
  img = loadImage('dance.jpg');
}

function setup() {
  createCanvas(800, 800);
  imageMode(CENTER);
  img.loadPixels();
  stroke(255, 255, 0);
  center = width / 2
}

function draw() {
  background(0);
  var mx = constrain(mouseX, center - s / 2, center + s / 2);

var x = map(mx, center - s / 2, center + s / 2, 640, 0);
  x = floor(x);
  // draw pixel images
  for (var y = 0; y < height; y++) {
    var c = img.get(x, y);
    set(DP, y/3, c);
  }
  for ( y =  height; y >0; y--) {
     c = img.get(x, y);
    set(Dp, height/2-y/3+30, c);
  }
  updatePixels();

//thumbnail
  image(img, mx, height - s / 4, s, s);
  line(width / 2, height - s / 2, width / 2, height);
//loop
  DP += 2 ;
  if (DP >= width) {
    DP = 0;
  }
  Dp -= 2 ;
  if (Dp <=0){
    Dp = width;
  }
}