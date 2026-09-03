FF f ;
ArrayList<Veh> v ;
boolean debug = false ;

void setup() {
  size(700, 700);
  f = new FF(40);
  v = new ArrayList<Veh>();
  for (int i = 0; i < 20; i++) {
    v.add(new Veh(new PVector(random(width), random(height)), random(2, 5), random(0.1, 0.5)));
  }
}

void draw() {
  background(255);
  PVector a = new PVector(20, 300);
  PVector b = new PVector(500, 450);

  stroke(0);
  strokeWeight(2);
  //line(a.x,a.y,b.x,b.y);
  //fill(0);
  //ellipse(a.x, a.y, 10, 10);
  //ellipse(b.x, b.y, 10, 10);

  if (debug) f.show();
  for (Veh veh : v) {
    veh.follow(f);
    veh.run();    

    PVector vv = new PVector(veh.pos.x, veh.pos.y);

    PVector n = scalarProjection(vv, a, b);
    strokeWeight(0.5);
    line(vv.x, vv.y, n.x, n.y);
    noStroke();
    fill(255, 0, 0);
    ellipse(n.x, n.y, 20, 20);
  }
}

void keyPressed() {
  debug = !debug ;
}

void mousePressed() {
  f.init();
}

PVector scalarProjection(PVector p_, PVector a_, PVector b_) {
  PVector ap = PVector.sub(p_, a_);
  PVector ab = PVector.sub(b_, a_);
  ab.normalize();
  ab.mult(ap.dot(ab));
  PVector nP = PVector.add(a_, ab);
  return nP;
}