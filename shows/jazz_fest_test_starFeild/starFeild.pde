import processing.sound.*;

Amplitude amp ;
AudioIn in ;
PVector pos, nOff ;

star neuerStern;
ArrayList<star> starArray = new ArrayList<star>();
float h2;//=height/2
float w2;//=width/2
float d2;//=diagonal/2
int numberOfStars = 2000;
int newStars =20;

void setup() {
  size(900, 900);
  w2=width/2;
  h2= height/2;
  d2 = dist(0, 0, w2, h2);
  noStroke();
  neuerStern= new star();
  frameRate(9000);
  background(0);
  pos = new PVector(width/2,height/2);
  nOff = new PVector(random(10000),random(1000));
  
  amp = new Amplitude(this);
  in  = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}
void draw() {
  float aa = 0.05;//amp.analyze();
  
  fill(0, 15);
  rect(0, 0, width, height);
  fill(255);
  
  pos.x = map(noise(nOff.x),0,1,0,width);
  pos.y = map(noise(nOff.y),0,1,0,height);
  nOff.add(0.01,0.01,0);
  
  neuerStern.render();
  for (int i = 0; i<newStars; i++) {   // star init
    starArray.add(new star());
  }


  for (int i = 0; i<starArray.size(); i++) {
    if (starArray.get(i).x<0||starArray.get(i).x>width||starArray.get(i).y<0||starArray.get(i).y>height) starArray.remove(i);
    starArray.get(i).move(aa);
    starArray.get(i).render();
  }
  if (starArray.size()>numberOfStars) {//
    for (int i = 0; i<newStars; i++) {
      starArray.remove(i);
    }
  }
}

//boolean sketchFullScreen() {// force fullscreen
