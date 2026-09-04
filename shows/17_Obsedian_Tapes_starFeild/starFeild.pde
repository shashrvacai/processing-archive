import processing.sound.*;

Amplitude amp ;
AudioIn in ;

star neuerStern;
ArrayList<star> starArray = new ArrayList<star>();
int numberOfStars = 2000, newStars =20;
PVector starcontrol;

void setup() {
  size(900, 900);

  starcontrol = new PVector(width/2, height/2);

  noStroke();
  neuerStern= new star();
  frameRate(9000);
  background(0);

  amp = new Amplitude(this);
  in  = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}
void draw() {
  float aa = amp.analyze();

  fill(0, 15);
  rect(0, 0, width, height);
  fill(255);
  
  
  
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

       if (key == 'r')    starcontrol = new PVector(0, 0);
  else if (key == 't')    starcontrol = new PVector(width/2, 0);
  else if (key == 'y')    starcontrol = new PVector(0, width);
  else if (key == 'h')    starcontrol = new PVector(width, height/2);
  else if (key == 'n')    starcontrol = new PVector(width, height);
  else if (key == 'b')    starcontrol = new PVector(width/2, height);
  else if (key == 'v')    starcontrol = new PVector(0, height);
  else if (key == 'f')    starcontrol = new PVector(0, height/2);
  else if (key == 'g')    starcontrol = new PVector(width/2, height/2);
  
}

//boolean sketchFullScreen() {// force fullscreen
