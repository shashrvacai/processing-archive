var I1;var I2;var I3;
var state = 0;
var nxtState = 0;
var counter = 0;
var T = 0; 

function preload(){
	I1= loadImage("dover01.jpg");
	I2= loadImage("iceland02.jpg"); 
	I3 = loadImage("03.png");
	
}
function setup() {
  createCanvas(1024,768);
}

function draw() {
	background(105);
	
if (state == nxtState)	{
	if (state === 0){
		image(I1,100,100,300,443);
	} else if(state ===1){
		image(I2,100,100,300,443);
	}else if(state ===2){
		image(I3,100,100,300,443);
		T++;
		if(T==30){
			nxtState= 1;
		}
	}

	
	
} else {
	counter++;
	if (counter==30){
		state = nxtState;
		counter = 0;
	}
	
	var a = map(counter,0,30,0,255);
	tint(255,a);
		if (nxtState === 0){
		image(I1,100,100,300,443);
	} else if(nxtState ===1){
		image(I2,100,100,300,443);
	}else if(nxtState ===2){
		image(I3,100,100,300,443);
	}
	
	tint(255,255-a);
		if (state === 0){
		image(I1,100,100,300,443);
	} else if(state ===1){
		image(I2,100,100,300,443);
	}else if(state ===2){
		image(I3,100,100,300,443);
	}
}


}

function keyTyped(){    
  if (key =='0'){   
		nxtState = 0;  
	}	else if (key =='.'){
		nxtState = 1;   
	}else if (key =='1'){
		nxtState = 2;   
	}
}