var song ;
 var button ;
 var amp ;
 
 function setup(){
 	creteCanvas(200,200);
 	song  = loadSound("outlierS.mp3",loaded);
 	amp = new p5.amplitude();
 	background(25);
 }
 
 function loaded(){
 	button = createButton("play");
 	button.mousePressed(togglePlaying);
 }
 
 function draw(){
 	
 }
 
 function togglePlaying(){
 	if (!song.isPlaying()){
 		song.play();
 		song.setVolume(0.3);
 		button.html("pause");
 	} else {
 		song.stop();
 		button.html("play");
 	}
 }
 