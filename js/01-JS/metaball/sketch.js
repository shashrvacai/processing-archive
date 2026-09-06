var blobs = []

function setup() {
  createCanvas(500,500);
	colorMode(HSB);
  for (i = 0; i < 10; i++) blobs.push(new Blob(random(100,200 ),random(100,200)));
}

function draw() {
  background(0);
  loadPixels();
  for (x = 0; x < width; x++) {
    for (y = 0; y < height; y++) {
      let sum = 0;
      for (i = 0; i < blobs.length; i++) {
				let d = dist(x,y,blobs[i].x,blobs[i].y);//too heavy...
      	let xdif = x - blobs[i].x;
				let ydif = y - blobs[i].y;
      	//let d = sqrt((xdif * xdif) + (ydif * ydif));
        sum += 10 * blobs[i].r*10 / d;
      }
			if(sum > 230  && sum <255){
				set(x, y, color(map(sum,230,255,0,255), 255, 255));
			}
      
    }
  }
  updatePixels();

  for (i = 0; i < blobs.length; i++) {
    blobs[i].update();
  }
}