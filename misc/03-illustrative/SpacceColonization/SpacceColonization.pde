Tree tree;
float min_dist = 10;
float max_dist = 100;

void setup() {
  size(600, 600);
  tree = new Tree();
}

void draw() {
  background(51);
  tree.show();
  tree.grow();
  
   if(keyPressed){
  setup();
  }
}
