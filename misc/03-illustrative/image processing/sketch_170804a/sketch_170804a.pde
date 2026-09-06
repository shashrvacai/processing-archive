PImage frog;

void setup(){
    size(1000,1223);
    frog = loadImage("1.jpg");
}

void draw(){
  image(frog,0,0);
  loadPixels();
  frog.loadPixels();
  for(int x = 0 ; x < width ; x ++){
    for(int y = 0 ; y < height ; y ++){
      float d = dist(x,y,width/2,height/2);
      int loc = x + y * width ;
      float r = red(frog.pixels[loc]);
      float g = green(frog.pixels[loc]);
      float b = blue(frog.pixels[loc]);
      pixels[loc] = color(255-r,255-g,255-b);
    }
  }
  updatePixels();
}