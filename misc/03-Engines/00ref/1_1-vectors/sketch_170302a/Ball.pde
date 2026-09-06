class Ball {
  
  PVector location;
  PVector velocity;
  PVector Acc;
  PVector Mouse;
  
  float mass;
   
  Ball(){
    location = new PVector(random(width), random(height));
    velocity = new PVector(0,0); 
    Acc= new PVector(0.00,0.00);
    mass= random(1,2);
  }
  
  void move(){
    //PVector mouse = new PVector(mouseX,mouseY);
   // mouse.sub(location);
   // mouse.setMag(0.2);
   // Acc = mouse;   
    
    velocity.add(Acc);
    location.add(velocity);
    velocity.limit(5);
    Acc.mult(0);
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force, mass);
    Acc.add(f); 
  }
  
  void edges(){
if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;   
    }
  }
  
  void display() {
    noStroke();
    fill(0);
    ellipse(location.x,location.y,mass*20,mass*20);
  }

 
}

  
  