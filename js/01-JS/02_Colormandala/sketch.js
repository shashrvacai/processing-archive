var A = 6.0 ; //angle
var S = 0.05;// speed
var Sc ; //dist of the circle from the particular center

function setup() {
  createCanvas(1200,1200);
  noStroke;
   background(2,22,1);
}

function draw() {
	scale(2); // whole canvas has been scaled for cinematic effects
  var Ball0 = map(A/2,10,S/2,20,100);
  var Ball1 = map(A/2,20,S/2,30,100);
  var Ball2 = map(A/2,20,S/2,10,300);
  
  // ---------------- background color change -----------------------
  var R =map(A/2,10,S/2,10,13) ; var G =map(A/2,10,S/2,10,229) ; var B =map(A/2,10,S/2,10,178) ;
 background(R,G,B,50);
 
 
  translate(width/4, height/4);   // position of the center
  
  //----- OBJECT 1 ----
  
  rotate(A);  // spin object 1 
  for (var i= 0; i<5 ;i++){
    push();
     rotate(i*PI/5);    
     translate(10, Ball1);
     Sc = map(A/2,20,S/2,0,50)
     var x = cos(A)*Sc;          
     var y = sin(A)*Sc;
     var O1 = map(A/2,20,S/2,0,25);
     stroke(6,40,160,01);
     fill(167,45,16,0);
     var r1 = map(A/2,20,S/2,250,100);
     ellipse(0,y,r1,r1);
           
          // ------ OBJECT 2 -----
          rotate(A);
          for (var j= 0; j<3 ;j++){
            push();
            rotate(j*PI/6);
            translate(Ball0/3, Ball1/3);
            strokeWeight(.5);
            stroke(25,50);
            fill(26,21,47,70);
             var r2 = map(A/2,80,S/2,500,30);
            ellipse(x,0,100,30);
                  
                 // ---- OBJECT3 ----
                  rotate(A);
                  for (var k= 0; k<3 ;k++){
                  push();
                  rotate(PI/3);
                  translate(Ball1, Ball2);
                  //fill(56,69,169);
                    var r3 = map(A/2,80,S/2,250,50);
                    var O3 = map(A/2,80,S/2,0,50);
                    stroke(5,6,16,O3);
                  rect(x,0,40,25);
                  pop();
              }
          pop();
      }
     pop();
  }
  
  A += S;
}

function mousePressed(){
 background(14,25,12);
}