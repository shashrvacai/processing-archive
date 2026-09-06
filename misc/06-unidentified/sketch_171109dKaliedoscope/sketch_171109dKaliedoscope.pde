float oldAngle=-100, oldDist, pas;
int  n=3; 
boolean see=false;

void setup() {
  size(600, 600);
  pas=TWO_PI/n; 
  background(255);strokeWeight(5);
}

void draw() {
  if (mousePressed) { 
    float an=atan2(mouseY-height/2, mouseX-width/2); 
    float d=dist(mouseX, mouseY, width/2, height/2); 
    if (oldAngle != -100) {
       translate(width/2, height/2);
      for (float a=0; a<TWO_PI; a+=pas) {
        line(cos(oldAngle+a)*oldDist, sin(oldAngle+a)*oldDist, cos(an+a)*d, sin(an+a)*d);
      }
    }
    oldAngle = an;
    oldDist=d; 
 } else {
  oldAngle=-100;
 }
}

 

void mousePressed() { 
  oldAngle=atan2(mouseY-height/2, mouseX-width/2); 
  oldDist=dist(mouseX, mouseY, width/2, height/2);
}



void keyReleased() {
  if (key=='+') {
    n++;
  } else if (key=='-') {
    n--;
  } else if (keyCode==10) { 
    background(255);
  }
    n=constrain(n, 1, 200);
    pas=TWO_PI/n;
}