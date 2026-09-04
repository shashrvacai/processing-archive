Drop[] drops = new Drop[500]; // array of drop objects

void setup() {
  size(640, 360); // size of the window
  for (int i = 0; i < drops.length; i++) { // we create the drops 
    drops[i] = new Drop();
  }
  
    PFont f = createFont( "Arial", 24 );
    textFont(f);
}

void draw() {
  pushMatrix();
    fill(0,155);
    rect(0,0,width, height);
    
  popMatrix();
  
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall(); // sets the shape and speed of drop
    drops[i].show(); // render drop
  }
}
