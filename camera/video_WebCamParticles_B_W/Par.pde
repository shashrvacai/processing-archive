class Particle {
  float ls ;
  float x;
  float y;

  float vx;
  float vy;

  Particle() {
    x = random(width);
    y = random(height);
    float a = PI/2;
    float speed = random(1, 5);
    vx = cos(a)*speed;
    vy = sin(a)*speed;
    ls = 260 ;
  }

  void display() {
    noStroke();
    color c = Buffer.get(int(x), int(y));
    fill(c,150);
    rect(width-(x*2), y*2, 2, 2);
  }

  void move() {
    x = x + vx;//random(-5, 5);
    y = y + vy;//random(-5, 5);z
    if (y < 0) {
      y = height;
    } 

    if (y > height) {
      y = 0;
    }
    if (x < 0) {
      x = width;
    } 

    if (x > width) {
      x = 0;
    }
  }
  
  boolean isDead(){
    if(ls < 0){
      return true ;
    } else {
      return false ; 
    }    
  }
}
