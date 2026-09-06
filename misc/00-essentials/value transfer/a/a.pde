PVector mouse = new PVector();
int[] data ;  
 
void setup() {
  size(500, 500);
  fill(0);
}
 
void draw() {
  background(255);
  mouse.set(mouseX, mouseY);
  ellipse(mouse.x, mouse.y, 30, 30);
  thread("writeToPipe");
  
  data = new int[5]; // Create
  data[0] = width-mouseX; // Assign
  data[1] = height-mouseY;
  data[2] = 75;
  
  println(mouse.array());
}
 
 
void writeToPipe() {
  saveStrings("../myfifo", str(data));
}
