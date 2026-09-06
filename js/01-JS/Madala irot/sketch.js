
//if (nexample == 1) { nrepeat = 7; elpx = 150; elpy = 275; nellps = 8; xinc = -20; yinc = 10; }

var nrepeat = 5;
var elpx = 2.2;         /// ripple factor in this case
var elpy = 175;

var nellps = 12;
var xinc = 10;
var yinc = 10;
  
var melpy;
var mscale;

function setup() {
  smooth();
  createCanvas(750,750);
  background(0);
}

function draw() {
  noStroke();  
  fill(0); 
  rect(0,0,width,height);
    
  angrot = 0.0;
  angrotinc = 180.0/nrepeat;

  if (yinc > 0) { melpy = elpy + (nellps * yinc); }
  mscale = height / melpy;
  
  // ellipse
  noFill();
  strokeWeight(1);
  stroke(255);
  for (let j = 0; j < nrepeat; j++) {
    ellps((elpx*mscale),(elpy*mscale),nellps,(xinc*mscale),(yinc*mscale),angrot)
    angrot = angrot + angrotinc;
    }
}

function ellps (radx,rady,num,radxinc,radyinc,ellprot ) {
  angleMode(DEGREES); 
  let lxcor;
  let lycor;
  nradx = radx;
  nrady = rady;
  for (let i = 0; i < num; i++) {
    push();
    translate(width/2,height/2);
    rotate(ellprot);
    ellipse(0,0,nradx,nrady);
    // for (let ang = 0; ang <= 360; ang+=(360/10)) {
    //   let xcor = sin(ang) * nradx; 
    //   let ycor = cos(ang) * nrady; 
    //   if (ang > 0) { line(lxcor,lycor,xcor,ycor); }  
    //   lxcor = xcor;
    //   lycor = ycor; 
    // } 
    pop();
    nradx = nradx + radxinc;
    nrady = nrady + radyinc;
  }
}  


// if (nexample == 1) { nrepeat = 7; elpx = 150; elpy = 275; nellps = 8; xinc = -20; yinc = 10; }
//     if (nexample == 2) { nrepeat = 7; elpx = 95; elpy = 120; nellps = 10; xinc = -10; yinc = 5; }
//     if (nexample == 3) { nrepeat = 9; elpx = 100; elpy = 200; nellps = 10; xinc = -10; yinc = 5; }
//     if (nexample == 4) { nrepeat = 9; elpx = 100; elpy = 200; nellps = 10; xinc = -10; yinc = -5; }
//     if (nexample == 5) { nrepeat = 9; elpx = 150; elpy = 200; nellps = 10; xinc = -12.5; yinc = 7.5; }
//     if (nexample == 6) { nrepeat = 5; elpx = 250; elpy = 300; nellps = 12; xinc = -12.5; yinc = 7.5; }  
//     if (nexample == 7) { nrepeat = 7; elpx = 100; elpy = 200; nellps = 10; xinc = -10; yinc = -5; }    
//     if (nexample == 8) { nrepeat = 11; elpx = 98; elpy = 220; nellps = 10; xinc = -10; yinc = 10; } 
//     if (nexample == 9) { nrepeat = 9; elpx = 98; elpy = 220; nellps = 10; xinc = -10; yinc = 10; }          
//     if (nexample == 10) { nrepeat = 9; elpx = 98; elpy = 220; nellps = 10; xinc = -10; yinc = -10; }   
//     if (nexample == 11) { nrepeat = 9; elpx = 120; elpy = 240; nellps = 10; xinc = -10; yinc = 5; }   
//     if (nexample == 12) { nrepeat = 8; elpx = 100; elpy = 200; nellps = 10; xinc = -10; yinc = 5; }  
//     if (nexample == 13) { nrepeat = 7; elpx = 120; elpy = 240; nellps = 10; xinc = -10; yinc = 5; }        
//     if (nexample == 14) { nrepeat = 6; elpx = 200; elpy = 265; nellps = 21; xinc = -16; yinc = 0; } 

