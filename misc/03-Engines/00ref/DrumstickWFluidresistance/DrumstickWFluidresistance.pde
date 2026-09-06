ArrayList<veh> vs;
PVector pos, nOff ;

L l ;


void setup(){
  size(600,600);
  surface.setResizable(true);
  
  pos  = new PVector (width/2, height/2);
  nOff = new PVector(random(10000),random(10000));
  
  l = new L(floor(width/2),floor(height/2) , 100,100,1);
  
  vs = new ArrayList<veh>();
  for(int i = 0 ; i < 10 ; i++){
    vs.add(new veh(random(width),random(height)));
  }
}

void draw(){
  //background(255);
  pushMatrix();
  translate(width/2,height/2);
  fill(255,150);
  noStroke();
  rect(0,0,width,height);
  noFill();
  popMatrix();
  
  l.show(mouseX, mouseY);
  
  pos.x = map(noise(nOff.x),0,1,0,width);
  pos.y = map(noise(nOff.y),0,1,0,height);
  nOff.add(0.01,0.01,0);
    
 
  for(veh v :vs){
    v.aB(vs,pos);
    v.update();
    v.show();
    if (l.contains(v,mouseX,mouseY)) {
      // Calculate drag force
      PVector dragForce = l.drag(v);
      // Apply drag force to Mover
      v.aF(dragForce);
    }
  }
  
  
}

void mouseDragged(){
  vs.add(new veh(mouseX, mouseY));
}
