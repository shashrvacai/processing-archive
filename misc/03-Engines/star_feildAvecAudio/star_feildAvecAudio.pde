import processing.sound.*;

SoundFile nms;
FFT fft;
AudioDevice device;

Star[] stars = new Star[800];
float speed;

void  setup() {
  size(800,800);
  nms = new SoundFile(this, "vibraphon.aiff");     // song added 
  //nms.loop();                                      //loop song
  
  
  for (int i = 0; i < stars.length; i++) {
    stars[i]= new Star();
  }  
}

void draw() {
  fill(255,0,0,10);
  rect(0,0,width,height);
  noFill();
  
  speed = map(mouseX,0,width,0,20);
  //background(0);
  translate(width/2,height/2);
    for (int i= 0; i < stars.length ; i++){
    stars[i].update();
    stars[i].show();
    }
}