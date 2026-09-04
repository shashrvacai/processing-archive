import processing.sound.*;

Amplitude amp;
AudioIn in;

int NUM_PARTICLES = 1000;
ParticleSystem p;
boolean On = true ;
float aa =  0 ;
float Px, Py ;
float a = 0 ;
float r = 450 ; 
float c = 400 ;
float d = 400 ;


void setup()
{
  smooth();
  //fullScreen(1);
  size(500,500);
  surface.setResizable(true);

  //  -- Audio In 
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);

  background(0);
  p = new ParticleSystem();
}

void draw()
{  
  if(keyPressed == true && key =='7'){
    aa=00;
  }else{
   aa = amp.analyze(); 
  }


  noStroke();
  fill(0, 15);
  rect(0, 0, width, height);


  /// Noise Tracker
  Px =(width/2-(sin(a)*r));
  Py = height/2-(cos(a)*r);
  fill(255);
  //ellipse(Px, Py, 20, 20);    /// debugger 

  p.update();
  p.render();
  a+= aa/5 ;          /// change in noise 


  if ( key == '1') {
    c =400;
    d =400 ;
  } else if ( key == '2') {
    c =350;
    d =300 ;
  } else if ( key == '3') {
    c =250;
    d =250 ;
  } else if ( key == '4') {
    c =200;
    d =150 ;
  } else if ( key == '5') {
    c =100;
    d =100 ;
  }
}
