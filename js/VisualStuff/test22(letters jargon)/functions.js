var a = "a"

function drawLetter(){
  background(56,238,172);
  translate(width/2-230,height/2-170);    // -- translates it to the middle of the screen
    for(var i= 0 ; i <= 400; i+=120){
      for(var j= 0; j<=300; j+=120){
        fill(19,0,70);
        rect(i,j,S,S);
        fill(255);
        var sFont = random(12,72);
        var pFont = sFont/4;
        textSize(sFont);
        //textAlign(CENTER);
        text(a,i+s,j+s+pFont);
      }
  }
}

function changeLetter(){
  a = Letter.value();
  drawLetter();
}