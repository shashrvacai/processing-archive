  var x = 0;
  var y= 0;
  var A = 0;
  var R = 0; var G = 0; var B = 0;  // the capital RGB is the inside colors (fill)
  
  
  var r = 0 ; var g = 0 ; var b = 0 ;  // can use this for the outline Stroke 
  
function setup() {
  createCanvas(1000,1000);
}
x
function draw() {
/*               ******    OPTIONAL CODE     ******
background(255);  background 
line(x,0,x,height); line to test the code
r = 255-R; // oppsite value to R(G/B)
g = 255-G;
b = 255-B;
stroke(r,g,b);
*/
  translate(x,y);
  rotate(A)
  //noStroke();
  fill(R,G,B);
  rect(0,0,100,100);  // change this to  rect or any other shape ../ 
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
  B = random(0,255); // this will change the B value on click  
}


