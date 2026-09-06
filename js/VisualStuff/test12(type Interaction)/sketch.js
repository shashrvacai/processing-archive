var intro;
var drink;
var large;
var swim;
var state = 0; //0=intro, 1=drinl , 2= large,3 = swim
var typed ="";
var hasCried = false;

function preload(){
	intro = loadImage("01.jpg");
	drink  = loadImage("02.jpg");
	large = loadImage("03.jpg");
	swim = loadImage("04.jpg");
}

function setup() {
  createCanvas(1024,768);
  textFont("Helvetica");
  textSize(22);
  textAlign(CENTER);
}

function draw() {
  background(255);
  if (state === 0){
  	image(intro,100,100,500,500);
  } 
  else if (state === 1){
  	image(drink,100,100,500,500);
  }
  else if (state === 2){
  	image(large,100,100,400,557);
  }
  else if (state === 3){
  	image(swim,100,100,400,591);
  }
  
  text(typed,0,650,width,30);
}

function keyPressed(){
	if (keyCode == BACKSPACE){
		typed = '';
	}
}


// states
function keyTyped(){
	if (key =='0'){
		state = 0;
	}else if (key =='1'){
		state = 1;
	}else if (key =='2'){
		state = 2;
	}else if (key =='3'){
		state = 3;
	} else if (keyCode == RETURN){
		// actions	
		if (typed == 'drink'){
			typed = '';
			if (hasCried){
				state = 3;
			}else {
				state = 1;
		}
	} else if (typed == 'eat'){
			state = 2;
			typed = '';
	} else if (typed == 'intro'){
			state = 0;
			typed = '';
	} else if (typed == 'cry'&& state == 2){
			hasCried = true;
			state = 3;
			typed = '';
	} 
	}
	
	
	else {
		typed += key ;
		}
}