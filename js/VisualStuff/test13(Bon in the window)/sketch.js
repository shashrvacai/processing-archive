
var state = 0 ; // stage in story
var typed ="";  // what has to be typed

function setup() {
  createCanvas(1024,768);
  textFont("Helvetica");
  textSize(22);
  textAlign(CENTER);
  fill(255);
}

function draw() {
  background(103,12,156);
  if (state === 0){              // GARDEN
  	background(103,200,156);
  	textSize(22);
  	text("Bon looks out of the window",0,150,width,20);
  	text("Do you want bon to wave his hand ? ",0,180,width,30);
  	textSize(12);
  	text("Type 'Wave' or 'Go'? ",0,210,width,30);                     // WAVE or GO
  } 
  else if (state === 1){        //wave hand
  	background(103,12,156);
  	textSize(22);
  	text("Bon waves his hand, But gets no respose",0,150,width,20);
  	text("So decides to go in the house anyways",0,180,width,30);
  	textSize(12);
  	text("Type  'Go' to go inside the house  ",0,210,width,30);         // GO
  }
  else if (state === 2){ //  At the door
  	background(203,12,156);
  	textSize(22);
  	text("the door of the house is open. at the door Bon wonders",0,150,width,20);
  	text("If he should go IN or return HOME",0,180,width,30);
  	textSize(12);
  	text("Type 'In' or 'HOME'? ",0,210,width,30);         // IN or HOME
  }
  else if (state === 3){        //living room
  	background(103,12,156);
  	textSize(22);
  	text("He does not see anyone in the living room",0,150,width,20);
  	text("should he climb the STAIRS? or go in the KITCHEN ?",0,180,width,30);
  	textSize(12);
  	text("Type 'STAIRS' or 'KITCHEN'? ",0,210,width,30);         
  	textSize(22);
  	text("Or he can also return HOME",0,450,width,20);   // STAIRS or KITCHEN or HOME
  }
  else if (state === 4){        //kitchen -- Tap  ^living room
  	background(103,12,50);
  	  	text("There is hot coffee on the table",0,150,width,20);
  	text("there is sound of water dripping. Should he ignore it ? or go to the sound ?",0,180,width,30);
  	textSize(12);
  	text("Type 'FOLLOW' or 'IGNORE'? ",0,210,width,30);         
  	textSize(22);
  	text("Or he can also return HOME",0,450,width,20);   // TAP or KITCHEN or HOME;
  }
  else if (state === 5){        //tap
  	background(103,12,50);
  	text("There is a water dripping from a tap",0,150,width,20);
  	text("HE closes the TAP and goes back out",0,180,width,30);   // default to LIVING ROOM
  }
  else if (state === 6){        //stairs  (transition)
  	background(103,12,200);
  	text("climbing up the stairs",0,650,width,30);
  }
  else if (state === 7){        //Hallway
  	background(103,12,156);
  	text("in the hallway there are 3 doors",0,150,width,20);
  	text("which room does he choose to go ? ",0,180,width,30);
  	textSize(12);
  	text("Choose '1','2' or '3'? ",0,210,width,30);         
  	textSize(22);
  	text("Or he can also return HOME",0,450,width,20);   // 1 or 2 or 3;
  }
  else if (state === 8){        //Cube room 1
  	background(103,12,156);           // default to HALLWAY
  	text("when he opens the door, he sees the ceiling fan on the floor and open box on the ceiling",0,150,width,20); 
   
  }
  else if (state === 9){        //mirro room 2
  	background(103,12,156);     //default to  HALLWAY
  	text("THis is a empty room with only a mirror in it ",0,150,width,20); 
  }
  else if (state === 10){        //window
  	background(103,12,156);     
  	text("In this room there is the window which he saw from the outside ?",0,150,width,20); 
  	textSize(12);
  	text("Do you want to go the 'WINDOW' ? ",0,210,width,30);         
  	textSize(22);
  	text("Or he can also return HOME",0,450,width,20);   // WINDOW or HOME;
  }
  else if (state === 11){        //Inside window
  	background(103,12,156);
  	text("In the window he sees a boy looking at him",0,650,width,30); // default to GARDEN
  } 
   text(typed,0,350,width,30);
}

function keyPressed(){
	if (keyCode == BACKSPACE){
		typed = '';
	}
}

function keyTyped(){    // Directory of keep code
  if (key =='0'){   
		state = 0;  // GARDEN ---- // WAVE or GO
	}	else if (key ==','){
		state = 1;    //wave hand ----- // GO
	}else if (key =='.'){
		state = 2;  //  At the door -----// IN or HOME
	}else if (key =='/'){
		state = 3;  //living room  ----- // STAIRS or KITCHEN or HOME 
	}else if (key =='4'){
		state = 4;  //kitchen ----- // TAP or OUT or HOME;
	}else if (key =='5'){ 
		state = 5;    //tap --- // default to LIVING ROOM
	}else if (key =='6'){
		state = 6;   //stair  --  Transition
	}else if (key =='7'){
		state = 7;  //Hallway  ---- // 1 or 2 or 3;
	}else if (key =='8'){   
		state = 8; //Cube room 1  ----- // default to HALLWAY
	}else if (key =='9'){
		state = 9; //mirro room 2   ----- // default to HALLWAY
	}else if (key =='='){
		state = 10;   //window  ----- // WINDOW or HOME;
	}else if (key =='/'){
		state = 11; //Inside window  ---- // GARDEN
	}
	                                    // type words   
	else if (typed == 'wave'){
			state = 1;
			typed = '';
	} else if (typed == 'go'){
			state = 2;
			typed = '';
	}else if (typed == 'in'|| typed == 'ignore'){
			state = 3;
			typed = '';
	} else if (typed == 'kitchen'){
			state = 4;
			typed = '';
	}else if (typed == 'stairs'){
			state = 6;
			typed = '';
	} else if (typed == 'follow'){
			state = 5;
			typed = '';
	}else if (typed == '1'){
			state = 8;
			typed = '';
	}else if (typed == '2'){
			state = 9;
			typed = '';
	}else if (typed == '3'){
			state = 10;
			typed = '';
	}else if (typed == 'window'){
			state = 11;
			typed = '';
	}else if (typed == 'hallway'){
			state = 7;
			typed = '';
	}

	else {    // take input from the user
		typed += key ;
		}
}