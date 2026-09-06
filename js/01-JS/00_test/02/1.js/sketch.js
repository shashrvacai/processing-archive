function setup() {
  createCanvas(900, 900);
}

function draw() {
  background(112);
  stroke(225, 20);
  fill(0,20 );

  for (var x = 0; x < windowWidth+50; x += 60) {
    for (var i = x; i <= windowHeight+50 ; i += 100) {
      for (var j = 100; j > 0; j -= 10) {
        ellipse(x, i, j, j);
      }
    }
  }

  stroke(0, 20);
  fill(225,10);
  for (var a = 900; a > 0; a -= 20) {
    rect( 900-a,0-a, a, 850);
  }



}