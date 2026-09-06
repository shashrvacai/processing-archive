var song ;
var sliderV;
var sliderR;
var sliderP ;

function preload(){
  song = loadSound("song.mp3");
}
function setup() {
  createCanvas(100,100);
  sliderV= createSlider(0,1,0.5,0.01); // volume
  button = createButton("play");
  button.mousePressed(togglePlaying);
  background(51);
}

function togglePlaying(){
  if (!song.isPlaying()){
    song.loop();
    button.html("pause");
  }else{
    song.pause();
    button.html("play");
  }
}

function draw() {
  background(0);
  song.setVolume(sliderV.value());
}