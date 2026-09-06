//screen 1 Variables
var A = 0;
var Ox =250;
var Oy = 470;
var Sc = 200;
var S =1;
var R = 10;

//screen2
var Angle = 0;
var Speed = 0.5;

//preload
function preload(){
   img =loadImage('dance.jpg')
   BG = loadImage('Sj.jpg')
   img1 = loadImage('OOMB.jpg')
}
function setup() {
  createCanvas(500,897);
  textFont("Arima Madurai")// load font 
  textAlign(CENTER);
  imageMode(CENTER);
  image(BG,width/2,height/2,width,height);
}
function screen1(){ // collage 1
    //load image
  var ImagePos = random(0,width);
  var SI = get(ImagePos,ImagePos,200,200);
  var x = Ox + cos(A)*Sc;
  var y = Oy + sin(A)*Sc;
  image(SI,x,y,100,100);
  A += S;
  Sc +=S;
}

function screen3(){
  noStroke();
  var ranX = random(-100,100);
  var ranY = random(-100,100);
  var Rx = mouseX+ranX*2;
  var Ry = mouseY+ranY*2;
  var r = map(mouseX,0,width,0,255);   //color map
  var g = map(mouseX,0,height,0,255);  //color map
  
  fill(r,100,g);
  ellipse(Rx,Ry,100,100);
  image(img1,mouseX+ranX,mouseY+ranY,100,100);

  fill(0);
  textSize(24);
  text("This is a collage",width/2-90,height/3,width/2,width/2);   // text content
  textSize(12);
  text("click to change function",width/2-100,height/3+50,width/2,width/2);
}

function draw() {

 screen1();

}

