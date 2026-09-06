

function setup() {
  createCanvas(windowWidth, windowHeight);
	background(230,10);
  strokeWeight(4);
  pixelDensity(2);//increase for better resolution images.


}

let zoff = 0;
let angle = 0;

function draw() {

  let size = map(mouseX,0,width,2,height);
  let animationSpeed = 0.000002;
  let mainColor = 15;
	let radius = map(mouseX,0,width,2,10);

  background(255);
  stroke(mainColor);
  noFill();

  for (i = 0; i <= width ; i += 5) {
    beginShape();
    for (j = 0; j <= height ; j += 10) {
      let x =i;
      let y =j;
      let scale = 0.0005;//using a scale vaiable because steps between i and j counters are too large steps for noise function.
      
      //check if points are inside the slider size value.
      if (dist(i, j, width/2, height) < size) {
        n = map(noise(i * scale, j * scale, zoff), 0, 1, -1, 1);
        x = i +  n*radius * sin(angle + n * 100);
        y = j +  n*radius * cos(angle + n * 100);
     }

      curveVertex(x, y);
      // point(x,y);
    }
    endShape();
  }

    zoff += 0.001;
    angle += animationSpeed;

}
