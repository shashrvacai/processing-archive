import processing.sound.*;

Amplitude  amp ;
AudioIn in ;

PVector pos1,pos2, nOff ;
float theta =  0; 

void setup() {
  size(600, 1000);
  background( 60 );
  noStroke();

  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in. start();
  amp.input(in);

  pos1 = new PVector(width/2, height/2);
  pos2 = new PVector(width/2, height/2);
  nOff = new PVector(random(10000), random(1000));
  
  background(0);
}

void draw() {  //draw function loops


fill(0,1);
rect(0,0,width,height);
 noFill();



float am = amp.analyze();
  int aa =  floor(map(am, 0, 1, 50, 20)); 
    
  pos1.x = map(noise(nOff.x),0,1,0,width/2);
  pos1.y = map(noise(nOff.y),0,1,0,height);
  pos2.x = map(noise(nOff.x),0,1,width,width/2);
  pos2.y = map(noise(nOff.y),0,1,0,height);
  nOff.add(am,am,0);
  fill(255,0,0);
  //ellipse(pos.x, pos.y, 48, 48);
  
  FanSpin(am,aa,pos1.x, pos1.y);
  FanSpin(am,aa,pos2.x, pos2.y);
}

void FanSpin( float am_ ,int triangles , float x_ , float y_) {

  float alpha = (TWO_PI/triangles) ;
  float delta =  (frameCount*0.015) ;
  float h = map(am_,0,1,50,500); //.21 * width/2;
  float w = h * sin( alpha );
  int c = 0;
  for (int i = 0; i< triangles; i++) {
    if ( i % 2 == 0) c = 0; 
    else c = 255;
    blendMode(BLEND);
    pushMatrix();
    translate( x_,y_ );
    rotate( alpha * i +delta );
    fill( c );
    noStroke();
    triangle( 0, 0, 0, -h, w, -h);
    popMatrix();
  }
}
