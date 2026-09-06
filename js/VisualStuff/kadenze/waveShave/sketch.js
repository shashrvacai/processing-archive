var xSpace = 16 ;
var w ;
var A = 0.0;
var amp = 75.0 ;
var per = 500.0;
var dx ;
var yVal ;


function setup() {
  createCanvas(1300,600);
  w = width+16;
  dx = (TWO_PI/per)*xSpace
  yVal = new Array(floor(w/xSpace))
  
  
  
}

function draw() {
  var c = map (mouseY,0,height,0,255)
  background(255-c,100,255,10);
  calWave();
  renderWave();
}

function calWave(){
  A += 0.02;
   var x = A ;
    for (var i = 0  ; i <yVal.length; i++){
      yVal[i] = sin(x)*amp ;
      x+=dx
    }
}

function renderWave() {
  
   noFill()
   for (var i =-90 ; i <680 ; i+=30){
     var b = map (i,0,width,0,255)
     var c = map (mouseY,0,height,0,255)
  stroke(255,c,b,40);
     var a = map (i,-90,width,1,50)
       for (var x =0 ; x <yVal.length ; x++){
         ellipse(x*xSpace+b*2, i + yVal[x],2*a,a/4*i*0.03)
       }
     
   }
}