import processing.sound.*;

PVector pos, nOff ;  // PVector pour randommwalker

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
  size(800,800);
  surface.setResizable(true);

  //  -- Audio In 
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);

  background(0);
  p = new ParticleSystem();
  
  pos = new PVector(width/2,height/2);
  nOff = new PVector(random(10000),random(10000));
}

void draw()
{  
  if(keyPressed == true && key =='7'){
    aa=00;
  }else{
   aa =amp.analyze(); 
  }


  noStroke();
  fill(0,50);
  rect(0, 0, width, height);

  /// Noise Tracker
  pos.x = map(noise(nOff.x),0,1,0,width);
  pos.y = map(noise(nOff.y),0,1,0,height);
  nOff.add(0.01,0.01,0);
  
  Px =pos.x ;//(width/2-(sin(a)*r));
  Py = pos.y;//height/2-(cos(a)*r);
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
