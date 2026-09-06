var state =0;
var typed =""; 
var I0; var I1;var I2;var I3;var I4;var I5;var I6;var I7;var I8;var I9;var I10;var I11;
var nState = 0; // nextState 
var C = 0;// counter
var T =0 ;//transition

function preload(){
 I0= loadImage("00.jpg");
 I1= loadImage("01.jpg");
 I2= loadImage("02.jpg");
 I3= loadImage("03.jpg");
 I4= loadImage("04.jpg");
 I5= loadImage("05.jpg");
 I6= loadImage("06.jpg");
 I7= loadImage("07.jpg");
 I8= loadImage("08.jpg");
 I9= loadImage("09.jpg");
 I10= loadImage("10.jpg");
 I11= loadImage("11.jpg");
 }

function setup() {
  createCanvas(1024,768);
  textFont("Helvetica");
  textSize(22);
  textAlign(CENTER);
  fill(255);
  noStroke();
}

function draw() {
   background(0);
   textSize(22);
  textAlign(CENTER);
  fill(255);
   if (nState == state) {
	  if (state === 0){              // GARDEN
	  	image(I0,width/2-300,120,600,450);
	  	textSize(22);
	  	text("Bon sees a boy in the window",0,50,width,30);
	  	text("Do you want Bon wave to the boy ? ",0,80,width,30);
	  	textSize(12);
	  	text("Type 'Wave'",0,560,width,30);                     // WAVE or GO
	  } 
	  else if (state === 1){        //wave hand
	  	image(I1,width/2-300,120,600,450);
	  	textSize(22);
	  	text("Bon waves his hand, but gets no respose",0,50,width,20);
	  	text("Do you want Bon to go inside that house ?",0,80,width,30);
	  	textSize(12);
	  	text("Type  'Go' to go inside the house  ",0,560,width,30);         // GO
	  }
	  else if (state === 2){ //  At the door
	  image(I2,width/2-300,120,600,450);
	  	textSize(22);
	  	text("The door of the house is open. at the door Bon wonders",0,50,width,30);
	  	text("If he should go in or return home",0,80,width,30);
	  	textSize(12);
	  	text("Type 'In' or 'HOME'? ",0,560,width,30);         // IN or HOME
	  }
	  else if (state === 3){        //living room
	  image(I3,width/2-300,120,600,450);
	  	textSize(22);
	  	text("He does not see anyone in the living room",0,50,width,30);
	  	text("should he climb the STAIRS? or go in the KITCHEN ?",0,80,width,30);
	  	textSize(12);
	  	text("Type 'STAIRS' or 'KITCHEN'? ",0,560,width,30);         
	  	text("Or he can also return HOME",0,640,width,20);   // STAIRS or KITCHEN or HOME
	  }
	  else if (state === 4){        //kitchen -- Tap  ^living room
	  image(I4,width/2-300,120,600,450);
	  textSize(22);
	  	 text("There is hot coffee on the table",0,50,width,30);
	  	text("there is sound of water dripping. Should he ignore it ? or go to the sound ?",0,80,width,30);
	  	textSize(12);
	  	text("Type 'FOLLOW' or 'IGNORE'? ",0,560,width,30);         
	  	text("Or he can also return HOME",0,640,width,20);   // TAP or KITCHEN or HOME;
	  }
	  else if (state === 5){        //tap
	  	image(I5,width/2-300,120,600,450);
	  	textSize(22);
	  	text("There is a water dripping from a tap",0,50,width,30);
	  	text("He closes the tap  and goes back out",0,80,width,30);   // default to LIVING ROOM
	  	textSize(12);
	  	text("(this trasition is automatic)",0,560,width,30);
	  	T++;
		if(T==210){
			nState= 3;
		}
	  }
	  else if (state === 6){        //stairs  (transition)
	  	image(I6,width/2-300,120,600,450);
	  	textSize(22);
	  	text("climbing up the stairs",0,560,width,30);
	  	textSize(12);
	  	text("(this trasition is automatic)",0,650,width,30);
	  	T++;
		if(T==210){
			nState= 7;
		}
	  }
	  else if (state === 7){        //Hallway
	  	image(I7,width/2-300,120,600,450);
	  	textSize(22);
	  	text("in the hallway there are 3 doors",0,50,width,20);
	  	text("which room does he choose to go ? ",0,80,width,30);
	  	textSize(12);
	  	text("Choose '1','2' or '3'? ",0,560,width,30);         
	  	textSize(12);
	  	text("Or he can also return HOME",0,640,width,30);   // 1 or 2 or 3;
	  }
	  else if (state === 8){        //Cube room 1
	  	image(I8,width/2-300,120,600,450);           // default to HALLWAY
	  	textSize(22);
	  	text("when he opens the door, he sees the ceiling fan on ",0,50,width,30); 
	   	text("the floor and open box on the ceiling",0,80,width,60);
	   	textSize(12);
	  	text("(this trasition is automatic)",0,650,width,30);
	  	T++;
		if(T==210){
			nState= 7;
		}
	  }
	  else if (state === 9){        //mirro room 2
	  	image(I9,width/2-300,120,600,450);     //default to  HALLWAY
	  	textSize(22);
	  	text("This is a empty room with only a mirror in it ",0,50,width,30); 
	  	textSize(12);
	  	text("(this trasition is automatic)",0,560,width,30);
	  	T++;
		if(T==210){
			nState= 7;
		}
	  }
	  else if (state === 10){        //window
	  	image(I10,width/2-300,120,600,450);   
	  	textSize(22);
	  	text("In this room there is the window which he saw from the outside",0,50,width,30); 
	  	textSize(12);
	  	text("Do you want to go the 'WINDOW' ? ",0,560,width,30);   
	  	text("Or he can also return HOME",0,640,width,20);   // WINDOW or HOME;
	  }
	  else if (state === 11){        //Inside window
	  	image(I11,width/2-300,120,600,450); 
	  	textSize(22)
	  	text("In the window he sees a boy looking at him",0,50,width,30); // default to GARDEN
	  	textSize(12);
	  	text("(this trasition is automatic)",0,560,width,30);
	  	T++;
		if(T==210){
			nState= 0;
		}
	  }
   } else {
   		C++; 	
   		if(C == 30){
   			state = nState ;
   			C = 0;
   		} 
   		var a = map(C,0,30,255,0);
   		tint(255,255-a);
   		if (nState === 0){              // GARDEN
	  	image(I0,width/2-300,120,600,450);
	  	textSize(22);
	  	text("Bon sees a boy in the window",0,50,width,30);
	  	text("Do you want Bon wave to the boy ? ",0,80,width,30);
	  	textSize(12);
	  	text("Type 'Wave'",0,560,width,30);                     // WAVE or GO
	  } 
	  else if (nState === 1){        //wave hand
	  	image(I1,width/2-300,120,600,450);
	  	textSize(22);
	  	text("Bon waves his hand, but gets no respose",0,50,width,20);
	  	text("Do you want Bon to go inside that house ?",0,80,width,30);
	  	textSize(12);
	  	text("Type  'Go' to go inside the house  ",0,560,width,30);         // GO
	  }
	  else if (nState === 2){ //  At the door
	  image(I2,width/2-300,120,600,450);
	  	textSize(22);
	  	text("The door of the house is open. at the door Bon wonders",0,50,width,30);
	  	text("If he should go in or return home",0,80,width,30);
	  	textSize(12);
	  	text("Type 'In' or 'HOME'? ",0,560,width,30);         // IN or HOME
	  }
	  else if (nState === 3){        //living room
	  image(I3,width/2-300,120,600,450);
	  	textSize(22);
	  	text("He does not see anyone in the living room",0,50,width,30);
	  	text("should he climb the STAIRS? or go in the KITCHEN ?",0,80,width,30);
	  	textSize(12);
	  	text("Type 'STAIRS' or 'KITCHEN'? ",0,560,width,30);         
	  	text("Or he can also return HOME",0,640,width,20);   // STAIRS or KITCHEN or HOME
	  }
	  else if (nState === 4){        //kitchen -- Tap  ^living room
	  image(I4,width/2-300,120,600,450);
	  	textSize(22);
	  	 text("There is hot coffee on the table",0,50,width,30);
	  	text("there is sound of water dripping. Should he ignore it ? or go to the sound ?",0,80,width,30);
	  	textSize(12);
	  	text("Type 'FOLLOW' or 'IGNORE'? ",0,560,width,30);         
	  	text("Or he can also return HOME",0,640,width,20);   // TAP or KITCHEN or HOME;
	  }
	  else if (nState === 5){        //tap
	  	image(I5,width/2-300,120,600,450);
	  	textSize(22);
	  	text("There is a water dripping from a tap",0,50,width,30);
	  	text("He closes the tap and goes back out",0,80,width,30);   // default to LIVING ROOM
	  	textSize(12);
	  	text("(this trasition is automatic)",0,560,width,30);
	  }
	  else if (nState === 6){        //stairs  (transition)
	  	image(I6,width/2-300,120,600,450);
	  	textSize(22);
	  	text("climbing up the stairs",0,560,width,30);
	  	textSize(12);
	  	text("(this trasition is automatic)",0,650,width,30);
	  }
	  else if (nState === 7){        //Hallway
	  	image(I7,width/2-300,120,600,450);
	  	textSize(22);
	  	text("in the hallway there are 3 doors",0,50,width,20);
	  	text("which room does he choose to go ? ",0,80,width,30);
	  	textSize(12);
	  	text("Choose '1','2' or '3'? ",0,560,width,30);         
	  	textSize(12);
	  	text("Or he can also return HOME",0,640,width,30);   // 1 or 2 or 3;
	  }
	  else if (nState === 8){        //Cube room 1
	  	image(I8,width/2-300,120,600,450);           // default to HALLWAY
	  	textSize(22);
	  	text("when he opens the door, he sees the ceiling fan on ",0,50,width,30); 
	   	text("the floor and open box on the ceiling",0,80,width,60);
	   	textSize(12);
	  	text("(this trasition is automatic)",0,650,width,30);
	  }
	  else if (nState === 9){        //mirro room 2
	  	image(I9,width/2-300,120,600,450);     //default to  HALLWAY
	  	textSize(22);
	  	text("This is a empty room with only a mirror in it ",0,50,width,30); 
	  	textSize(12);
	  	text("(this trasition is automatic)",0,560,width,30);
	  }
	  else if (nState === 10){        //window
	  	image(I10,width/2-300,120,600,450);  
	  	textSize(22);
	  	text("In this room there is the window which he saw from the outside",0,50,width,30); 
	  	textSize(12);
	  	text("Do you want to go the 'WINDOW' ? ",0,560,width,30);         
	  	text("Or he can also return HOME",0,640,width,20);   // WINDOW or HOME;
	  }
	  else if (nState === 11){        //Inside window
	  	image(I11,width/2-300,120,600,450); 
	  	textSize(22)
	  	text("In the window he sees a boy looking at him",0,50,width,30); // default to GARDEN
	  }
   } 
   
   tint(255,a)
   if (state === 0){              // GARDEN
	  	image(I0,width/2-300,120,600,450);
	  	textSize(22);
	  	text("Bon sees a boy in the window",0,50,width,30);
	  	text("Do you want Bon wave to the boy ? ",0,80,width,30);
	  	textSize(12);
	  	text("Type 'Wave'",0,560,width,30);                     // WAVE or GO
	  } 
	  else if (state === 1){        //wave hand
	  	image(I1,width/2-300,120,600,450);
	  	textSize(22);
	  	text("Bon waves his hand, but gets no respose",0,50,width,20);
	  	text("Do you want Bon to go inside that house ?",0,80,width,30);
	  	textSize(12);
	  	text("Type  'Go' to go inside the house  ",0,560,width,30);         // GO
	  }
	  else if (state === 2){ //  At the door
	  image(I2,width/2-300,120,600,450);
	  	textSize(22);
	  	text("The door of the house is open. at the door Bon wonders",0,50,width,30);
	  	text("If he should go in or return home",0,80,width,30);
	  	textSize(12);
	  	text("Type 'In' or 'HOME'? ",0,560,width,30);         // IN or HOME
	  }
	  else if (state === 3){        //living room
	  image(I3,width/2-300,120,600,450);
	  	textSize(22);
	  	text("He does not see anyone in the living room",0,50,width,30);
	  	text("should he climb the STAIRS? or go in the KITCHEN ?",0,80,width,30);
	  	textSize(12);
	  	text("Type 'STAIRS' or 'KITCHEN'? ",0,560,width,30);         
	  	text("Or he can also return HOME",0,640,width,20);   // STAIRS or KITCHEN or HOME
	  }
	  else if (state === 4){        //kitchen -- Tap  ^living room
	  image(I4,width/2-300,120,600,450);
	  	textSize(22);
	  	 text("There is hot coffee on the table",0,50,width,30);
	  	text("there is sound of water dripping. Should he ignore it ? or go to the sound ?",0,80,width,30);
	  	textSize(12);
	  	text("Type 'FOLLOW' or 'IGNORE'? ",0,560,width,30);         
	  	text("Or he can also return HOME",0,640,width,20);   // TAP or KITCHEN or HOME;
	  }
	  else if (state === 5){        //tap
	  	image(I5,width/2-300,120,600,450);
	  	textSize(22);
	  	text("There is a water dripping from a tap",0,50,width,30);
	  	   // default to LIVING ROOM
	  	textSize(12);
	  	text("(this trasition is automatic)",0,560,width,30);
	  }
	  else if (state === 6){        //stairs  (transition)
	  	image(I6,width/2-300,120,600,450);
	  	textSize(22);
	  	text("climbing up the stairs",0,560,width,30);
	  	textSize(12);
	  	text("(this trasition is automatic)",0,650,width,30);
	  }
	  else if (state === 7){        //Hallway
	  	image(I7,width/2-300,120,600,450);
	  	textSize(22);
	  	text("in the hallway there are 3 doors",0,50,width,20);
	  	text("which room does he choose to go ? ",0,80,width,30);
	  	textSize(12);
	  	text("Choose '1','2' or '3'? ",0,560,width,30);         
	  	textSize(12);
	  	text("Or he can also return HOME",0,640,width,30);   // 1 or 2 or 3;
	  }
	  else if (state === 8){        //Cube room 1
	  	image(I8,width/2-300,120,600,450);           // default to HALLWAY
	  	textSize(22);
	  	text("when he opens the door, he sees the ceiling fan on ",0,50,width,30); 
	   	text("the floor and open box on the ceiling",0,80,width,60);
	   	textSize(12);
	  	text("(this trasition is automatic)",0,650,width,30);
	  }
	  else if (state === 9){        //mirro room 2
	  	image(I9,width/2-300,120,600,450);     //default to  HALLWAY
	  	textSize(22);
	  	text("This is a empty room with only a mirror in it ",0,50,width,30); 
	  	textSize(12);
	  	text("(this trasition is automatic)",0,560,width,30);
	  }
	  else if (state === 10){        //window
	  	image(I10,width/2-300,120,600,450);    
	  	textSize(22);
	  	text("In this room there is the window which he saw from the outside",0,50,width,30); 
	  	textSize(12);
	  	text("Do you want to go the 'WINDOW' ? ",0,560,width,30);         
	  	text("Or he can also return HOME",0,640,width,20);   // WINDOW or HOME;
	  }
	  else if (state === 11){        //Inside window
	  	image(I11,width/2-300,120,600,450); 
	  	textSize(22)
	  	text("In the window he sees a boy looking at him",0,50,width,30); // default to GARDEN
	  	textSize(12);
	  	text("(this trasition is automatic)",0,560,width,30);
	  }
   textSize(32);
   text(typed,0,580,width,50);
   textAlign(LEFT);
   textSize(12);
   fill(0,255,0);
   text("if any problem, reset the program (cmd+r/ctrl+r)",20,height-20);
   }	
   


function keyPressed(){
	if (keyCode == BACKSPACE){
		typed = '';
	}
}

function keyTyped(){    // Directory of keep code
  if (key =='0'){   // GARDEN ---- // WAVE or GO
		nState = 0;  
	}	else if (key ==','){
		nState = 1;    //wave hand ----- // GO
	}else if (key =='.'){
		nState = 2;  //  At the door -----// IN or HOME
	}else if (key =='/'){
		nState = 3;  //living room  ----- // STAIRS or KITCHEN or HOME 
	}else if (key =='4'){
		nState = 4;  //kitchen ----- // TAP or OUT or HOME;
	}else if (key =='5'){ 
		nState = 5;    //tap --- // default to LIVING ROOM
	}else if (key =='6'){
		nState = 6;   //stair  --  Transition
	}else if (key =='7'){
		nState = 7;  //Hallway  ---- // 1 or 2 or 3;
	}else if (key =='8'){   
		nState = 8; //Cube room 1  ----- // default to HALLWAY
	}else if (key =='9'){
		nState = 9; //mirro room 2   ----- // default to HALLWAY
	}else if (key =='='){
		nState = 10;   //window  ----- // WINDOW or HOME;
	}else if (key =='/'){
		nState = 11; //Inside window  ---- // GARDEN
	}
	if (keyCode == RETURN){		                                    // type words   
		if (typed == 'wave'){
			nState = 1;
			typed = '';
	} else if (typed == 'go'){
			nState = 2;
			typed = '';
	}else if (typed == 'in'|| typed == 'ignore'){
			nState = 3;
			typed = '';
	} else if (typed == 'kitchen'){
			nState = 4;
			typed = '';
	}else if (typed == 'stairs'){
			nState = 6;
			typed = '';
	} else if (typed == 'follow'){
			nState = 5;
			typed = '';
	} else if (typed == 'ignore'){
			nState = 3;
			typed = '';
	}else if (typed == '1'){
			nState = 8;
			typed = '';
	}else if (typed == '2'){
			nState = 9;
			typed = '';
	}else if (typed == '3'){
			nState = 10;
			typed = '';
	}else if (typed == 'window'){
			nState = 11;
			typed = '';
	}else if (typed == 'hallway'){
			nState = 7;
			typed = '';
	}else if (typed == 'home'){
			nState = 0;
			typed = '';
	}
	}

	

	else {    // take input from the user
		typed += key ;
		}
}