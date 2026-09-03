
PVector pos, nOff ;
float  r ;

void setup(){
  size(600,600);
  pos = new PVector(width/2,height/2);
  nOff = new PVector(random(10000),random(1000));
}

void draw(){
  blendMode(BLEND);
  fill(0,5);
  rect(0,0,width,height);
  noFill();
  
  
  r = random(400);
  pos.x = map(noise(nOff.x),0,1,0,width);
  pos.y = map(noise(nOff.y),0,1,0,height);
  //r = map(noise(nOff.x),0,1,0,140);
  nOff.add(0.05,0.05,0);
  
  if(keyPressed== true && key == '5'){
  blendMode(DIFFERENCE);
  fill(255);
   ellipse(pos.x, pos.y, r, r);
  }
}
