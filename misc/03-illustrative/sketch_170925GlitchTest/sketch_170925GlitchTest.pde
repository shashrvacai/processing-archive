GlitchObject myGlitch;
boolean glitch = true;
PImage img;
float w, h ;

PFont f1, f2, f3, f4;




void setup() {
  img = loadImage("01.png");
  f1 = createFont( "KhmerMN", 150);
  f2 = createFont( "EmojiOne", 150);
  f3 = createFont( "Jaapokki subtract", 150);
  f4 = createFont( "Adam", 150);
  rectMode(CENTER);



  size(1400, 500);
  myGlitch = new GlitchObject();
  h = random(200, 400);
  w = random(200, 400);

  textAlign(CENTER);
}

void draw() {
  background(0);
  //rect(h,w,100,100);

 //image(img, 0, 0, width, height);  //// image
  //stroke(0);
  //textFont(f3);
  //text("reel", width/2,height/2);    /// tect   


  if (glitch) { 
    //myGlitch.run();
    pushMatrix();
      //myGlitch.getSetGlitch1();
      stroke(255);
      textFont(f3);
      text("real-time", width/2, height/2);    /// tect   
    popMatrix();
    pushMatrix();
      //rect( width/2, height/2,200,50);
     myGlitch.getSetGlitch4();
      //noFill();
      
     popMatrix();
  }
}

void mousePressed() {
  glitch = !glitch;
}