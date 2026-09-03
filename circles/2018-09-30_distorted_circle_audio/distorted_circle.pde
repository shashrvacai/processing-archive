import processing.sound.*;

int ranSeed = 0 ; 
int count = 250 ;

Amplitude  amp ;
AudioIn in ;

void setup(){
  size(600,600);
   surface.setResizable(true);
   cursor(CROSS);
    noStroke();
    fill(0,130,164);
    
    amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in. start();
  amp.input(in);
}

void draw(){
  fill(0,15);
  rect(0,0,width,height);
  noFill();
  fill(255);
  randomSeed(ranSeed);
  
  float aa =  amp.analyze();
  
  float A =  radians(TWO_PI);
  for(int i = 0 ; i < count ; i ++){
    float randomX = random(0,width);
    float randomY = random(0,height);
    float circleX = width/2+cos(A*i)*300;
    float circleY = height/2+sin(A*i)*300;
    
    float x = map(aa,0.5,0,randomX,circleX);//lerp(randomX,circleX,faderX);
    float y = map(aa,0.5,0,randomY,circleY);//lerp(randomY,circleY,faderX);
    
    ellipse(x,y,11,11);
  }
}

void mousePressed(){
  ranSeed = int(random(100000));
}
