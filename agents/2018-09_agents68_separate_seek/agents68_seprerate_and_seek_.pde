ArrayList<veh> vs;

void setup(){
  size(600,600);
  vs = new ArrayList<veh>();
  for(int i = 0 ; i < 10 ; i++){
    vs.add(new veh(random(width),random(height)));
  }
}

void draw(){
  background(255);
  for(veh v :vs){
    v.aB(vs);
    v.update();
    v.show();
  }
}

void mouseDragged(){
  vs.add(new veh(mouseX, mouseY));
}