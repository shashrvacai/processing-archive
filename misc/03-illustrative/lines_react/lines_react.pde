StageManager sm;
boolean onPressed;
boolean newVertexSpawn;
int currentDrawingWormIndex;

void setup() {
  size(500, 500);
  smooth();
  frameRate(30);
  sm = new StageManager();
  
}

void draw() {
  sm.spawnItf(mouseX,mouseY,0.00001);
  background(255);
  if (onPressed) {
    Worm currentW = (Worm) sm.worms.get(currentDrawingWormIndex);
    currentW.spawnV(mouseX, mouseY);
    if(newVertexSpawn){
      sm.checkIntersect();
    }
  }else{
    sm.checkVanish();
  }
  sm.update();
  sm.display();
}

void mousePressed() {
  sm.spawnW();
  currentDrawingWormIndex = sm.worms.size()-1;
  onPressed = true;
}

void mouseReleased() {
  onPressed = false;
}

class Interference{
  
  PVector loc;
  float force;
  
  Interference(float initX,float initY,float force){
    this.force = force;
    loc = new PVector(initX,initY);
  }
}
