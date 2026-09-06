function setup() {
  print("Ready");
  rollDice(13);
  rollDice(12);
}

function rollDice(numSides) {
	var d = 1+ int(random(numSides));
	print("Rollin"+d);
}

function draw() {
  
}