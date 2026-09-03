int NUM=16;
int F;

ArrayList joints=new ArrayList();

class Joint {
  float[] p;
  float dep;

  Joint() {
    dep=0;
    p=new float[NUM];
    for (int i=0; i<NUM; i++) {
      float rad=TWO_PI/NUM*i;
      p[i]=noise((1-cos(rad))*0.5, (1-sin(rad))*0.5, F*0.001);
    }
  }

  boolean update() {
    strokeWeight(dep*0.1);
    beginShape();
    for (int i=0; i<NUM+2; i++) {
      float r=p[i%NUM];
      float rad=TWO_PI/NUM*i;
      float t=pow(dep, 1.4)*r;
      float x=cos(rad)*t;
      float y=sin(rad)*t;
      curveVertex(x, y);
    }
    
    endShape(CLOSE);
    dep+=00.5;
    if (dep>height) {
      return false;
    }
    return true;
  }
}

void setup() {
  size(640,640);
  //fullScreen();
  noFill();
  stroke(255);
}

void draw() {
  background(0);
  translate(width/2, height/2);

  F=frameCount;
  if (F%80==0) {
    joints.add(new Joint());
  }
  for (int i=0; i<joints.size(); i++) {
    Joint j = (Joint)joints.get(i);
    if (j.update()==false) {
      joints.remove(i);
    }
  }
}
