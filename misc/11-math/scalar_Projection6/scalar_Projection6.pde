void setup(){
    size(600,600);
}

void draw(){
  background(255);
  
  PVector a = new PVector(20,300);
  PVector b = new PVector(500,450);
  PVector mouse = new PVector(mouseX,mouseY);
  
  stroke(0);
  strokeWeight(2);
  line(a.x,a.y,b.x,b.y);
  line(a.x,a.y,mouseX, mouseY);
  fill(0);
  ellipse(a.x,a.y,10,10);
  ellipse(b.x,b.y,10,10);
  ellipse(mouseX,mouseY,10,10);
  
  PVector n = scalarProjection(mouse,a,b);
  strokeWeight(0.5);
  line(mouse.x,mouse.y,n.x,n.y);
  noStroke();
  fill(255,0,0);
  ellipse(n.x,n.y,20,20);
  
}

PVector scalarProjection(PVector p_ , PVector a_ , PVector b_){
  PVector ap = PVector.sub(p_,a_);
  PVector ab = PVector.sub(b_,a_);
  ab.normalize();
  ab.mult(ap.dot(ab));
  PVector nP = PVector.add(a_,ab);
  return nP;
}