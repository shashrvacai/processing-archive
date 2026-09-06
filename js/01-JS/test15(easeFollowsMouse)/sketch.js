  var x = 0;
  var y= 0;
  var A = 0;
  var R = 0; var G = 0; var B ;  // the capital RGB is the inside colors (fill)
  var S ; //size 
  var O;   //opacity
 	var sO ;   // strokeOpacity
  
  
  var r = 0 ; var g = 0 ; var b = 0 ;  // can use this for the outline Stroke 
  
function setup() {
	
	B = createSlider(0,255,56);
	O = createSlider(0,255,255);
	sO = createSlider(0,255,0);
	S = createSlider(100,500,150);
  createCanvas(1000,1000);
  
}

function draw() {
	stroke(0,sO.value());
  translate(x,y);
  rotate(A)
   fill(R,G,B.value(),O.value());
  rect(0,0,S.value(),S.value());  // change this to  rect or any other shape ../ 
  var easeIn = 0.125;  // easing value .. lesser the number the slower the follow up .. 
  var dif =  mouseX - x;
  var dify =  mouseY - y;
  x+=dif * easeIn;
  y+=dify * easeIn;
  A += 0.025 ;  // speed of rotation
  
  R = map (mouseX, 0, width,0,255); // it will change R- color as the mouse runs along X- axis  
  G = map (mouseY, 0, width,0,255); // it will change G- color as the mouse runs along Y- axis 
  
}


function mousePressed() {
  //B = random(0,255); // this will change the B value on click  
 background(255);
}


