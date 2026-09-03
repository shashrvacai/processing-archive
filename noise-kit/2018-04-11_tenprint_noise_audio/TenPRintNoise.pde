import processing.sound.*;

OpenSimplexNoise noise;
Amplitude amp;
AudioIn in;


void setup() {
  fullScreen(1);
  //size(500, 500);
  //surface.setResizable(true);
  noise = new OpenSimplexNoise();

  //  -- Audio In 
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

float noiseJump = 0 ;
float sWt = 5.0 ; 
int spacing = 25;
int numFrames = 100;
float R = 0.5;
float scale = 0.01;
float t =0 ;
float ms =0 ;

void draw() {
  float AIn =amp.analyze();
  t += AIn ;  // speed

  background(0);  
  stroke(255);
  strokeWeight(sWt);
  translate(width/2, height/2);
  for (int x = (-width/2); x<width/2; x+=spacing) {
    for (int y = (-height/2); y<height/2; y+=spacing) {
      float ns = (float)noise.eval(scale*x, scale*y, R*cos(TWO_PI*t), R*sin(TWO_PI*t));
      float ms = map(mouseX, 0, width, -0.7, 0.7);

      if (ns<noiseJump) {
        line(x, y, x+spacing, y+spacing);
      } else {
        line(x, y+spacing, x+spacing, y);
      }
    }
  }


  if (keyPressed == true) {
    if (key == 'q' || key == 'Q') {
      spacing += 1;
    } else if (key == 'w' || key == 'W') {    
      spacing -=1;
    } else if (key == 'e' || key == 'E') {    
       spacing = 25;
    } else if (key == 's' || key == 'S') {
      if (sWt > 1) {
        sWt -- ;
      } else {
        sWt = 1 ;
      }
    } else if (key == 'a' || key == 'A') {    
      sWt ++ ;
    }else if (key == 'd' || key == 'D') {    
      sWt = 5 ;
    } else if (key == '5') {
      noiseJump = 0;
    } else if (key == '4') {
      noiseJump = 0.1;
    } else if (key == '3') {
      noiseJump = 0.2;
    } else if (key == '2') {
      noiseJump = 0.5;
    } else if (key == '1') {
      noiseJump = 0.7;
    } else if (key == '6') {
      noiseJump = -0.1;
    } else if (key == '7') {
      noiseJump = -0.2;
    } else if (key == '8') {
      noiseJump = -0.3;
    } else if (key == '9') {
      noiseJump = -0.5;
    } else if (key == '0') {
      noiseJump = -0.7;
    }
  }
}