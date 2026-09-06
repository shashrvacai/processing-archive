var gender = false;

function setup() {

  createCanvas(1024,768);
}

function draw() {
  if (gender == true){
    Man();
    } else  {
    Woman();
  }
  function mousePressed(){
    gender= !gender;
  }
}

function Man(){
// Y co-ords
  var mapInnerY = map(mouseY, 0, 768, 110, 240);
  var mapOuterY = map(mouseY, 0, 768, 170, 210);
  var eyeCenterY = map(mouseY, 0,768, 220,270 );
  var eyeH = map(mouseY,0,768,90,50);
  var eyeW = map(mouseY,0,768,90,100);
  var EBsize= map(mouseY, 0,768,20,30);
  var ballY = map(mouseY, 0,768,eyeCenterY-10,eyeCenterY+7);
  var shadeCY = map(mouseY,0,768,eyeCenterY-50,eyeCenterY-10);
  var shadeW = map(mouseY,0,768,eyeW-10,eyeW-35);
  var noseY = map(mouseY, 0,768,200, 312 );
  var noseH = map(mouseY, 0,768,220,145 );
  var deg = map(mouseY, 0,768,257,250 );
    //RGb
  var G = map(mouseY,0,768,220,214);
  
//X Co-ords
  var ballX =map(mouseX , 0 , 1024 , 280, 320);
  var shadeCX = map(mouseX,0,1024,250,eyeCenterY-50)
  var CX1 = 230 ;
  var CX2 = 370 ;
  
  background(255,G,178);
  stroke(4);
  
  strokeWeight(0);
 //below
  fill(247,G,138);
  ellipse(250,shadeCY , shadeW, eyeH);
  ellipse(350, shadeCY, shadeW, eyeH);
  //eyes
  fill(255);
  ellipse(CX1, eyeCenterY, eyeW, eyeH);
  ellipse(CX2, eyeCenterY, eyeW, eyeH);
  //eyeBalls
  fill(0);
  ellipse(ballX-70, ballY, EBsize, EBsize);
  ellipse(ballX+70, ballY, EBsize, EBsize);
  //brows
  strokeWeight(18);
  line(200, mapOuterY, 270, mapInnerY);
  line(330, mapInnerY, 400, mapOuterY);
  //nose
  strokeWeight(6);
  fill(255,G,178);
  arc(300,noseY,100,noseH,radians(70),radians(deg) );
  
}

function Woman(){
  // Y co-ords
  var mapInnerY = map(mouseY, 0, 768, 110, 240);
  var mapOuterY = map(mouseY, 0, 768, 170, 210);
  var eyeCenterY = map(mouseY, 0,768, 220,270 );
  var eyeH = map(mouseY,0,768,90,50);
  var eyeW = map(mouseY,0,768,90,100);
  var EBsize= map(mouseY, 0,768,20,30);
  var ballY = map(mouseY, 0,768,eyeCenterY-10,eyeCenterY+7);
  var shadeCY = map(mouseY,0,768,eyeCenterY-50,eyeCenterY-10);
  var shadeW = map(mouseY,0,768,eyeW-10,eyeW-35);
  var noseY = map(mouseY, 0,768,200, 312 );
  var noseH = map(mouseY, 0,768,220,145 );
  var deg = map(mouseY, 0,768,257,250 );
    //RGb
  var R = map(mouseY,0,768,220,214);
  
//X Co-ords
  var ballX =map(mouseX , 0 , 1024 , 280, 320);
  var shadeCX = map(mouseX,0,1024,250,eyeCenterY-50)
  var CX1 = 230 ;
  var CX2 = 370 ;
  
  background(R,200,178);
  stroke(4);
  
  strokeWeight(0);
 //below
  fill(247,R,138);
  ellipse(250,shadeCY , shadeW, eyeH);
  ellipse(350, shadeCY, shadeW, eyeH);
  //eyes
  fill(255);
  ellipse(CX1, eyeCenterY, eyeW, eyeH);
  ellipse(CX2, eyeCenterY, eyeW, eyeH);
  //eyeBalls
  fill(0);
  ellipse(ballX-70, ballY, EBsize, EBsize);
  ellipse(ballX+70, ballY, EBsize, EBsize);
  //brows
  strokeWeight(18);
  line(200, mapOuterY, 270, mapInnerY);
  line(330, mapInnerY, 400, mapOuterY);
  //nose
  strokeWeight(6);
  fill(255,G,178);
  arc(300,noseY,100,noseH,radians(70),radians(deg) );
  
}
