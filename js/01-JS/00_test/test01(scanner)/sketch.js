var s = 200;
var DP = 0;
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
    set(DP, y / 2, c);
  }
  updatePixels();

  //thumbnail
  image(img, mx, height - s / 4, s, s);
  line(width / 2, height - s / 2, width / 2, height);


  //loop
  DP ++;
  if (DP >= width) {
    DP = 0;
  }
}