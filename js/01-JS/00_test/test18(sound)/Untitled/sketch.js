var song;
var A = 0.0 ; //angle
var S = 0.01;// speed
var Sc ; //dist of the circle from the particular center


function preload(){
	
}
function setup() {
createCanvas(1200,1200);
  noStroke;
   background(13,229,178);
 song = loadSound("outlierS.mp3",loaded);
}
function loaded(){
	song.loop();
}

function draw() {
	scale(2); // whole canvas has been scaled for cinematic effects
  var Ball0 = map(mouseX,0,width,0,100);
  var Ball1 = map(mouseX,0,height,0,100);
  var Ball2 = map(mouseX,0,width,10,300);
  
  // ---------------- background color change -----------------------
  var R =map(mouseX,0,width,0,13) ; var G =map(mouseX,0,width,0,229) ; var B =map(mouseX,0,width,0,178) ;
 background(R,G,B,5);
 
 
  translate(width/4, height/4);   // position of the center
  
  //----- OBJECT 1 ----
  
  rotate(A);  // spin object 1 
  for (var i= 0; i<5 ;i++){
    push();
     rotate(i*TWO_PI/5);    
     translate(0, Ball0);
     Sc = map(mouseX,0,width,0,50)
     var x = cos(A)*Sc;          
     var y = sin(A)*Sc;
     var O1 = map(mouseX,0,width,0,255);
     stroke(67,45,164,O1);
     fill(67,45,164,0);
     var r1 = map(mouseX,0,width,250,100);
     ellipse(0,y,r1,r1);
           
          // ------ OBJECT 2 -----
          rotate(A);
          for (var j= 0; j<3 ;j++){
            push();
            rotate(j*TWO_PI/3);
            translate(Ball0/2, Ball1/2);
            strokeWeight(2);
            stroke(255,50);
            fill(255,214,47,0);
             var r2 = map(mouseX,0,width,500,30);
            ellipse(x,0,100,r2);
                  
                 // ---- OBJECT3 ----
                  rotate(A);
                  for (var k= 0; k<3 ;k++){
                  push();
                  rotate(k*TWO_PI/3);
                  translate(Ball1, Ball2);
                  //fill(56,69,169);
                    var r3 = map(mouseX,0,width,250,50);
                    var O3 = map(mouseX,0,width,0,50);
                    stroke(56,69,169,O3);
                  rect(x,0,4,r3);
                  pop();
              }
          pop();
      }
     pop();
  }
  
  A += S;
}

function mousePressed(){
 background(14,255,127);
}
