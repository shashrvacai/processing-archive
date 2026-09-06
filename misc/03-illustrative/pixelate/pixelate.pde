import processing.video.*;
Movie movie;

int gX, gY;  // size of pixellation 

void setup() {
  size(720, 480);  
  background(0);
  noStroke();
  rectMode(CENTER);
  
  movie = new Movie(this, "miso.mov");
  movie.loop();

}

void draw() {
  background(0);  
  gX = int(map(mouseX, 0, width, 50, 2));
  gY = int(map(mouseY, 0, height, 2, 50));
  image(movie, 0, 0, width, height);
  
  Pixellate();
}

void movieEvent(Movie m) {
  m.read();
}

void Pixellate() {
  for (int i = 0; i< width; i+= gX) {
    for (int j = 0; j< height; j+= gY) {
      color fColor = get(i, j);
      fill(fColor);      
      rect(i, j, gX, gY);
    }
  }
}
