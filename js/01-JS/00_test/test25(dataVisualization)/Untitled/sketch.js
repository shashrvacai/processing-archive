
var p5ran = [];
var Hran = [];

function preload(){
	Hran = loadStrings("nu.txt");
}

function setup(){
	createCanvas(1000,500);
	
	for (var i =0; i <Hran.length;i++){
		p5ran[i] = random(0,100);
	}
}

function draw(){
	background(0);
	noStroke();
	
	for (var i =0 ; i <p5ran.length; i++){
		var rnd  = floor(p5ran[i]);
		var x =5+ rnd*10;
		
		fill(255,50);
		ellipse(x,height/2,10,10);
		
		
			
		rnd  = Hran[i];
			var x =5+ rnd*10;
		
		//fill(255,a);
		ellipse(x,height/2- 10,10,10);
		}
}

 