PShader Shrtoy;
void setup() {
size(640,360,P2D);
noStroke();
Shrtoy = loadShader("ShrtoyFrag.glsl"); 
Shrtoy.set("iResolution", float(width), float(height));
}
void draw() {
background(0);
Shrtoy.set("iGlobalTime", millis() / 1000.0);
filter(Shrtoy);
}
