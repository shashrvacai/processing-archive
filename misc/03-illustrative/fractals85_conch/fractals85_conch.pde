KF k;
void setup(){
  size(800,250);
  background(255);
  k = new KF();
}

void draw(){
  background(255);
  k.render();
  k.nL();
  if (k.getCount() > 5){
    k.restart();
  }

}