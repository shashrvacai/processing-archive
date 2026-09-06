var S = 100;   // size of the boxes
var s = S/2;
var Letter;

function setup() {
  
  createP('Use the Shuffle button, to shuffle the sizes of the letters'); 
  createP('put the alpphabet you want to check the size(limit it to 3 letters)');
   createP('');   //  --  empty para
  var button1 = createButton('shuffle');  // -- shuffle button
   Letter = createInput('');  // -- input box
   createP(''); 
  
  Letter.input(changeLetter);     // input box function
  button1.mousePressed(drawLetter);   // button function
  
  createCanvas(600,600);
  textAlign(CENTER);
  noStroke();
  drawLetter();
}


