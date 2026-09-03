Vehicle v ;
float e ,f  , ease;

void setup(){
  size(600,600);
  background(0);
  e = width/2;
  f = height/2 ;
   ease = 0.05 ;
  v = new Vehicle(width/2,height,6 );
}

void draw(){
  fill(0,0);
  rect(0,0,width,height);
  noFill();
  
 
  
 
  e += random(-500,500) * ease ;
  f += random(-500,500) * ease ;
  

  
  
  fill(255,50);
//  ellipse(e,f,10,10);
  PVector t = new PVector(e, f);
  v.seek(t);
  v.update();
  v.checkEdges();
  v.show();
  
  
  
}
