class Mover {


PVector loc;
PVector vel;
PVector  acc;

Mover(){
  loc=  new PVector(width/2,height/2);  
  vel=  new PVector(0,0);  
  acc=  new PVector(0,0); 
}

void update(){
  PVector mu = new PVector(mouseX,mouseY);
  mu.sub(loc);
  mu.setMag(0.1);
  acc= mu ;
  vel.add(acc);
   //vel.limit(topspeed);
    loc.add(vel);
}

void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(loc.x, loc.y, 48, 48);
  }

}