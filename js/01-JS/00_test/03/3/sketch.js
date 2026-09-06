var m =0 ;
var gender = false ; 
 function setup() {
 createCanvas(1024,768);
}

function draw() {

var MoveY = map(mouseY,0,768,200,568);
var MoveX = map(mouseX,0,1024,200,824);
  
translate(MoveX-300,MoveY-300);

 var S = dist(mouseX,mouseY,pmouseX,pmouseY);
 if(S>= 125){
   m+=10;
 }

function man(){

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
  var moochY = map(mouseY, 0,768,352,367);
    //RGb
  var G = map(mouseY,0,768,220,214);
  
//X Co-ords
  var ballX =map(mouseX , 0 , 1024 , 280, 320);
  var shadeCX = map(mouseX,0,1024,250,eyeCenterY-50)
  var CX1 = 230 ;
  var CX2 = 370 ;

  
  background(255,G,178);
  stroke(4);
  
 //mooch;
  strokeWeight(10);
  for(var lx=225 ; lx <= 380; lx += 15){
    line(lx,moochY,lx,moochY+m);
  }
  
  
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

function woman(){
  
   // Y co-ords
  var mapInnerY = map(mouseY, 0, 768, 110, 240);
  var mapOuterY = map(mouseY, 0, 768, 170, 210);
 
  
  var eyeW = map(mouseY,0,768,90,100);
  var EBsize= map(mouseY, 0,768,20,30);

  var maskY2 = map(mouseY,0,768,200,275);
  var maskY1 = map(mouseY,0,768,200,260);  
  var eyeH = map(mouseY,0,768,90,50); 
  var eyeCenterY = map(mouseY, 0,768, 220,270 );
  var WballY = map(mouseY, 0,768,eyeCenterY-30,eyeCenterY-10);
  var WpatchY = map(mouseY,0, 768,170,229);
  var noseH = map(mouseY,0,768,160,230);
  var noseB = map(mouseY,0,768, 330,350);
  var opacity = map(mouseY,0,768,0,100);
  var deg = map(mouseY, 0,768,257,250 );
    //RGb
  var R = map(mouseY,0,768,145,200);
  
//X Co-ords
  var WballX =map(mouseX , 0 , 1024, 320, 280);
  var WBrowX =map(mouseX , 0 , 1024, 240, 225);
  var shadeCX = map(mouseX,0,1024,250,eyeCenterY-50)
  var CX1 = 230 ;
  var CX2 = 370 ;
  
  background(241,R,216);
  stroke(4);
   
   //eye patch
  strokeWeight(0);
  fill(252,R,108);
  quad(184,maskY1,150, WpatchY,284, noseH,280, maskY2);
  quad(310,maskY2,310, noseH,460, noseH,420,  maskY1);
  
  //eyes
  strokeWeight(4);
  fill(255);
  arc(230,eyeCenterY,eyeW,eyeH,radians(190),radians(10));
  ellipse(370, eyeCenterY, eyeW, eyeH);
  //eyeBalls
  fill(0);
  ellipse(WballX-70, WballY, EBsize, EBsize);
  ellipse(WballX+70, WballY, EBsize, EBsize);
        //eyemask
      strokeWeight(0);
      fill(241,R,216);
      quad(310,maskY2,340, 450,450, 450,430,  maskY1);
      quad(180,maskY1,170, 450,250, 450,290, maskY2);
    //nose
  strokeWeight(4);
  line(284,noseH, 270,noseB);
  line(270, noseB, 330, mapOuterY+120);  
  
  //Brows
  fill(0);
  ellipse(WBrowX,noseH-15,40,10);
  ellipse(WBrowX+120 ,noseH-15,40,10);
  
  //cheeks
  strokeWeight(0); 
  fill(249,102,136, opacity);
  ellipse(210,eyeCenterY+50,80,80);
  ellipse(380,eyeCenterY+50,80,80);
  
}

  if (gender === true){
  woman();
  } else {
    man();
  }
}

function mousePressed(){
  gender = !gender
} 


