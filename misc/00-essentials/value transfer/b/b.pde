PVector p = new PVector();
 
void setup() {
  size(500, 500);
  fill(255);
}
 
void draw() {  
  background(0);
  ellipse(p.x, p.y, 30, 30);
  thread("readPipe");
}
 
void readPipe() {
  String[] s = loadStrings("../myfifo");
  p.set(float(s[0]), float(s[1]));
}
