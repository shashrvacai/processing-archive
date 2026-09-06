Mover[] movers = new Mover[10];

Attractor a;

float angle = 0;

void setup() {
  size(640,360,P3D);
    background(0);
  background(255);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1,2),random(-width/2,width/2),random(-height/2,height/2),random(-100,100)); 
  }
  a = new Attractor();
}

void draw() {
  pushMatrix();
  fill(0,10);
  rect(0,0,width,height);
  noFill();
  popMatrix();
  sphereDetail(8);
  lights();
  translate(width/2,height/2);
  rotateY(angle);

  
  a.display();

  for (int i = 0; i < movers.length; i++) {
    PVector force = a.attract(movers[i]);
    movers[i].applyForce(force);

    movers[i].update();
    movers[i].display();
  }
  
  angle += 0.003;

}

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x, float y, float z) {
    mass = m;
    position = new PVector(x,y,z);
    velocity = new PVector(1,0);
    acceleration = new PVector(0,0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    noStroke();
    fill(255);
    pushMatrix();
    translate(position.x,position.y,position.z);
    sphere(mass*8);
    popMatrix();
  }

  void checkEdges() {

    if (position.x > width) {
      position.x = 0;
    } 
    else if (position.x < 0) {
      position.x = width;
    }

    if (position.y > height) {
      velocity.y *= -1;
      position.y = height;
    }
  }
}


class Attractor {
  float mass;         // Mass, tied to size
  PVector position;   // position
  float g;

  Attractor() {
    position = new PVector(0,0);
    mass = 20;
    g = 0.4;
  }


  PVector attract(Mover m) {
    PVector force = PVector.sub(position,m.position);             // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    distance = constrain(distance,5.0,25.0);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float strength = (g * mass * m.mass) / (distance * distance); // Calculate gravitional force magnitude
    force.mult(strength);                                         // Get force vector --> magnitude * direction
    return force;
  }

  // Method to display
  void display() {
    stroke(255);
    noFill();
    pushMatrix();
    translate(position.x,position.y,position.z);
    sphere(mass*2);
    popMatrix();
  }
}
