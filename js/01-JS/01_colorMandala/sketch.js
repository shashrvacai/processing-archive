var A = 200.0 ; //angle
var S = 0.01;// speed
var Sc ; //dist of the circle from the particular center

function setup() {
  createCanvas(1200,1000);
  noStroke;
   background(230,212,17);
}

function draw() {
	scale(2); // whole canvas has been scaled for cinematic effects
  var Ball0 = map(110,120,200,201,101);
  var Ball1 = map(20,20,10,10,12);
  var Ball2 = map(1,2,1,1,2);
  

 
 
  translate(width/4, height/4);   // position of the center
  
  //----- OBJECT 1 ----
  
  rotate(A);  // spin object 1 
  for (var i= 0; i<10 ;i++){
    push();
     rotate(i*TWO_PI/2);    
     translate(10, Ball1);
     Sc = map(220,220,width/4,220,150)
     var x = cos(A)*Sc;          
     var y = sin(A)*Sc;
     var O1 = map(20,20,width/2,10,25);
     stroke(6,40,160,01);
     fill(16,45,16,10);
     var r1 = map(2,2,width/2,2,1);
     ellipse(10,10,r1,r1);
           
          // ------ OBJECT 2 -----
          rotate(A);
          for (var j= 0; j<3 ;j++){
            push();
            rotate(j*TWO_PI/6);
            translate(Ball0/3, Ball1/3);
            strokeWeight(.08);
            stroke(25,50,23,23);
            fill(265,21,47,1);
             var r2 = map(20,80,20,500,30);
            ellipse(x,0,100,r3);
                  
                 // ---- OBJECT3 ----
                  rotate(A);
                  for (var k= 0; k<3 ;k++){
                  push();
                  rotate(k*TWO_PI/3);
                  translate(Ball1, Ball2);
                  //fill(56,69,169);
                    var r3 = map(40,80,width,250,50);
                    var O3 = map(20,80,width,0,50);
                    stroke(5,6,16,O3);
                  rect(20,50,40,20);
                  pop();
              }
          pop();
      }
     pop();
  }
  
  A += S;
}

function mousePressed(){
 background(140,15,127);
}


