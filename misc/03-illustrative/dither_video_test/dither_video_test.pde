  
import processing.video.*;
Movie myMovie;

void setup() {
  size(800, 800);
  myMovie = new Movie(this, "a.mp4");
  myMovie.loop();
}

void draw() {
  tint(255);
  image(myMovie, 0, 0);
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}