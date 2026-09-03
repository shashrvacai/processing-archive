import  ddf.minim.analysis.*;
import  ddf.minim.*;

Minim       minim;
AudioPlayer jingle;
FFT         fft;

void setup(){
  size(600,400,P3D);
  
  minim = new Minim(this);
  
  jingle = minim.loadFile("jingle.mp3",1024);
  jingle.loop();
  fft = new FFT(jingle.bufferSize(),jingle.sampleRate());
}

void draw(){
  background(0,10);
  stroke(255);
  strokeWeight(0.4);
  noFill();
  
  translate(width/2,0);
  fft.forward(jingle.mix);
  
  for(int i = 0; i <fft.specSize()/2; i++)
  {
      rectMode(CENTER);
      rect( fft.getBand(i)*9 , height/2, 3, height);
      rect( -fft.getBand(i)*9 , height/2, 3, height);
  }
}