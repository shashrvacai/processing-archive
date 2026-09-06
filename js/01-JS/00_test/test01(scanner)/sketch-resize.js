var img;

function preload(){
  img = loadImage('dress.png')
}

function setup(){
  createCanvas(1000,1000);
  imageMode(CENTER);
}

function draw(){
  image(img,mx,height-s/2);
  
}