float step = 20;
float maxAmp = 50;
float maxDistance = 300;
color c1 = color(22, 199, 175);
color c2 = color(199, 21, 133);
ArrayList<Oscillator> oscillators;

void setup(){
  size(500, 500, P3D);
  sphereDetail(4);
  noStroke();  
  oscillators = new ArrayList<Oscillator>();
  oscillators.add(new Oscillator(new PVector(width / 2.0, height / 2.0)));
}

void draw(){
  background(0);
  translate(width / 2, height / 2, -200);
  rotateX(PI / 3);
  rotateZ(PI / 4);
  translate(-width / 2, -height / 2, 0);
  lights();
  for(float x = 0; x <= width; x += step){
    for(float y = 0; y <= height; y += step){
      PVector p = new PVector(x, y);
      pushMatrix();
      float z = 0;
      for(Oscillator osc: oscillators){
        z += osc.getValue(p);
      }
      translate(x, y, z);
      fill(map(z, 100, -100, red(c1), red(c2)),
            map(z, 100, -100, green(c1), green(c2)),
            map(z, 100, -100, blue(c1), blue(c2)));
      sphere(5);
      popMatrix();
    }
  }
  for(Oscillator osc: oscillators){
    osc.update();
  }
  ArrayList<Oscillator> nextOscillators = new ArrayList<Oscillator>();
  for(Oscillator osc: oscillators){
    if(osc.energy >= 0.01){
      nextOscillators.add(osc);
    }
  }
  oscillators = nextOscillators;
}

void mousePressed(){
  oscillators.add(new Oscillator(new PVector(mouseX, mouseY)));
}

class Oscillator{
  
  PVector loc;
  float time;
  float energy;
  
  Oscillator(PVector _loc){
    loc = _loc;
    time = frameCount;
    energy = 1.0;
  }
  
  void update(){
    energy *= 0.995;
  }
  
  float getValue(PVector p){
    float d = loc.dist(p);
    float amp = maxAmp * energy * ((maxDistance - d) / maxDistance);
    return map(sin(d * PI / 128 - (frameCount - time) * 0.1), -1, 1, -amp, amp);
  }
  
}