import processing.sound.*;
//import spout.*;

PImage colormap;

//Spout spout;

Amplitude  amp ;
AudioIn in ;

float xmotion = 0;
float ymotion = 0;
float rmotion = 0;

int elems = 120; // can improve the rendering quality by increasing it and lowering the xrad_step / yrad_step variable
int dots = 120; // improve tunnel quality (to be used with rect_size)

int dots_step = 1;
int elems_step = 1;
int state = 0 ;

float []ldmotion = new float[elems * dots];


void setup() {
    //spout = new Spout(this);

  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in. start();
  amp.input(in);


  size(700, 1024);
  surface.setResizable(true);
  
  fill(0, 0, 0, 24);
  rect(0, 0, width, height);
  noFill(); 
  
  frameRate(60);    // ------------------ frame rate 
  
  colormap = loadImage("data.jpg");    // image for color map 
  
  for (int e = 0; e < elems; e += elems_step) {
    for (int d = 0; d < dots; d += dots_step) {
      ldmotion[d + e * dots] = random(0.005);
    }
  }

}

void draw() {
  float aa =  amp.analyze();

  //spout.sendTexture();
 
  draw_landscape(aa);
}


void draw_landscape(float aa_) {
  float mx = 4. + mouseX / width * 8;
  
  int rect_size = (int)mx;

  noStroke();
  
  // initial circle size
  int bsize = 16;
  
  int xoff = width / 2;
  int yoff = height / 2;
  
  int xrad_step = 8;
  int yrad_step = 8;
  
  int xdeform = 100;
  int ydeform = 100;
  
  float xrmotion_size =60;
  float yrmotion_size = 60;
  
  for (int e = 0; e < elems; e += elems_step) {
    float de = (float)e / elems;    
    float bd = de * 4;
    
    float ex = sin(de * 360 * (PI / 180) + xmotion);
    float ey = cos(de * 360 * (PI / 180) + ymotion);
    
    float xrad = e * xrad_step + bsize + sin(de * 360 * (PI / 180) + xmotion) * xrmotion_size;
    float yrad = e * yrad_step + bsize + cos(de * 360 * (PI / 180) + xmotion) * yrmotion_size;
    
    float final_ex = xoff + ex * xdeform;
    
    float xpp = (de * 360 * (PI / 180)) / 2;
  
    float xrepeat = 1; // this doesn't work as expected ? if you increase this you must add "&(colormap.width-1)" to xxd below (after "xrepeat)") and "&(colormap.height-1)" to yyd
    int xxd = ((int)(de * (colormap.width * xrepeat)));
    
    for (int d = 0; d < dots; d += dots_step) {
      float dd = (float)d / dots;
      
      float xp = dd * 360 * (PI / 180);
      float yp = dd * 360 * (PI / 180);
      
      // important phase to improve the rendering, offset the dots per circles so that it "fill more space", additionaly mess up the dots gradually
      xp += xpp + rmotion * ldmotion[d + e * dots];
      yp += xpp + rmotion * ldmotion[d + e * dots];
      
      float final_x = final_ex + sin(xp) * xrad;
      float final_y = yoff + ey * ydeform + cos(yp) * yrad;
      
      // do not compute outside boundary
      if (final_x >= width+16 || final_x < -16 || final_y >= height +16 | final_y < -16) {
        continue;
      }
      
      // apply colormap / texture
      float yrepeat = 1;
      
      int yyd = (((int)(dd * (colormap.height * yrepeat)))) * colormap.width;
 
      int cl = (int)xxd + yyd;
      
      int r = (int)(red(colormap.pixels[cl]) * bd);
      int g = (int)(green(colormap.pixels[cl]) * bd);
      int b = (int)(blue(colormap.pixels[cl]) * bd);
      
      fill(r, g, b);      
      rect(final_x, final_y, rect_size, rect_size);      
    }
  }
  
  xmotion += aa_ ;
  ymotion += aa_;
  rmotion += 0.12;
}

void keyPressed(){
if(key == '0') colormap = loadImage("data.jpg");
else if(key == '1') colormap = loadImage("data1.jpg");
else if(key == '2') colormap = loadImage("data2.jpg");
else if(key == '3') colormap = loadImage("data3.jpg");
}
