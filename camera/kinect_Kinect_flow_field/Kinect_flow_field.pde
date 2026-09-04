import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

FlowField           flowField;
ArrayList<Particle> particles;
float               particlesIncrement = 6;
float        particleSpacing = 1.8;
float        particleSpacing2 = 1.9;

float particlesIncrement2 = 2;

float zTranslate = 1000;
float xPadding = 0;
float maxDepth = 1900;
float subtractZ = 0;

float r;
float g;
float b;

boolean onBeat;

Kinect2                kinect2;
AudioInput             song;
Minim                  minim;
ddf.minim.analysis.FFT fft;
BeatDetect             beat;

void setup() {
 // fullScreen(P3D, 2);
 size(1920,1080,P3D);
  background(0);
 
  flowField = new FlowField(300);
  particles = new ArrayList<Particle>();
  xPadding = width / 10;

  kinect2 = new Kinect2(this);
  kinect2.initDepth();
  kinect2.initDevice();

  r = 0;
  g = 105;
  b = 255;

  minim = new Minim(this);
  song  = minim.getLineIn();
  beat  = new BeatDetect();

}

void draw() {
  beat.detect(song.mix);
  
 background(0);
  
 scale(4);
 translate(width/2,height/2);
 rotate(PI);
 
 
  
  
  flowField.updateField();

  

  int[] depth = kinect2.getRawDepth();

  for (int x = 0; x < kinect2.depthWidth; x += particlesIncrement) {
    for (int y = 0; y < kinect2.depthHeight; y += particlesIncrement) {
      int offset = x + y * kinect2.depthWidth;
      int z = depth[offset];
      if (z > maxDepth || z == 0) {
        continue;
      }
      
      Particle particle = new Particle(
        x * particleSpacing,
        y * particleSpacing,
        subtractZ - z
      );      
      particles.add(particle);
    }
  }




  for (int i = 0; i < particles.size(); i++) {
    particles.get(i).update();
    particles.get(i).render();
    if (particles.get(i).age > particles.get(i).lifeSpan) {
      particles.remove(i);
    }
  }


   
     
}


/// beat brightness

//   stroke(160, 255, 255, 190);
//   for (int x = 0; x < kinect2.depthWidth; x += particlesIncrement2) {
//     for (int y = 0; y < kinect2.depthHeight; y += particlesIncrement2) {
//        int offset = x + y * kinect2.depthWidth;
//        int z = depth[offset];
//        if (z > maxDepth || z == 0) {
//          continue;
//        }
//        if ( beat.isOnset() ) {
//          point(
//            x * particleSpacing2,
//            y * particleSpacing2,
//            subtractZ - z
//          );
//        }
//     }
//   }
