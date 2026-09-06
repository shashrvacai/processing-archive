ArrayList<PVector> path;

float A = 0;
int res= 5; // amount of detail
float r = 0.001;
float sS = 0.01;// spped of rotation
Orbit sun ;
Orbit end ;

void setup(){
  background(63,0,255);
  size(1000,1000);
  path = new ArrayList<PVector>();
  sun = new Orbit(0,0,100,0);       /// the startin point
  Orbit next = sun;
  for (int i=0;i<19;i++){              // amount of detail .. in terms of circles
    next = next.addChild();
  }
    end = next;
}

void draw(){
  translate(mouseX,mouseY);
    
    rotate(r);
    for(int i=0; i <res; i++){
    Orbit next =  sun;
    while(next != null){
      next.update();
    next.show();
    next =  next.child;
      }
   path.add(new PVector(end.x,end.y));
    }

  
  beginShape();
  stroke(232,205,53,45);
  for (PVector pos: path){
    vertex(pos.x,pos.y);
  }
  endShape();
   r = r + sS;
   
  // sun.show();
}