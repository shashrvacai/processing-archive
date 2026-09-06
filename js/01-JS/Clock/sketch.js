function setup() {
  createCanvas(600,600);
  angleMode(DEGREES);
}

function draw() {
  background(0);
  translate(width/2,height/2);
  rotate(-90);
  let hr =hour();
  let mins = minute();
  let sec= second();
  
  strokeWeight(4);
  //noFill();
  blendMode(SCREEN);
  fill(200,15,50,150)
  stroke(255);
  //ellipse(width/2,height/2,300,300);
  let endsec = map (sec,0,60,0,360);
  arc(0,0,280,280,0,endsec,OPEN);
  
  blendMode(SCREEN);
  fill(15,200,50,150)
  let endmin = map (mins,0,60,0,360);
  arc(0,0,260,260,0,endmin,OPEN);
  
  blendMode(HARD_LIGHT);
  fill(50,200,200,150)
  let endhr = map (hr%12,0,12,-90,360);
  arc(0,0,240,240,0,endhr,OPEN);
  
  fill(255);
  noStroke();
  
}