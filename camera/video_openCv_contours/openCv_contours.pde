import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
PImage src, canny,dst;

ArrayList<Contour> contours;
ArrayList<Contour> polygons;

void setup() {
  size(980, 1440);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  

  video.start();
}

void draw() {
  pushMatrix();
    fill(0,100);
    rect(0,0,width,height);
  popMatrix();
  scale(3);
  opencv.loadImage(video);
  
  opencv.findCannyEdges(1, 275);
  canny = opencv.getSnapshot();
  
  opencv.gray();
  opencv.threshold(200);
  dst = opencv.getOutput();
  contours = opencv.findContours();
  
//  image(video, 0, 0 );
  image(canny, 0, 240);

  fill(255);
  stroke( 255);
  strokeWeight(1);
  
    for (Contour contour : contours) {
    stroke(0, 255, 0);
    //contour.draw();
    
    stroke(255);
    beginShape();
    for (PVector point : contour.getPolygonApproximation().getPoints()) {
      vertex(point.x, point.y);
    }
    endShape();
  }
}

void captureEvent(Capture c) {
  c.read();
}
