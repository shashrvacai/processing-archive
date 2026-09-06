float yOff = 0 ;
int seed = 7;

void setup(){
  size(600,600);
  smooth(); 
}

void draw(){
  background(255);
  fill(0);
  
  
  
  //pushMatrix();
  // stroke(125);   
  // translate(width/2+223,height);
  //  b(width/4-20,0);
  //popMatrix();
  
  //pushMatrix();
  // stroke(85);   
  // translate(width/2-100,height);
  //  b(width/4-20,0);
  //popMatrix();
  
  pushMatrix();
  
    translate(width/2,height/2);
    yOff += 0.005;
    randomSeed(seed);
    stroke(0);
    b(2,0);
   
  popMatrix();
  
}

void mousePressed(){
  yOff = random(1000);
  seed = millis();
}



void b(float h_ , float xOff_){
  //float sw = map(h_,2,120,5,1);
  float sA = map(h_,400,4,255,100);
  stroke(1,255-sA);
  //float t = random(0 , PI/3);
  
  line(0,0,0,-h_);
  translate(0,-h_);
  h_ *= 2f ;
  xOff_ += 0.1 ;
  
  if(h_ <400){
    
    int  n = int(random(0,5));
    
    for(int i = 0 ; i < n ; i++){
      float t = map(noise(xOff_+i,yOff),0,1,-PI,PI);
      if(n%2==0) t *= -1;
      pushMatrix();
      rotate(t);
      b(h_, xOff_);
      popMatrix();
    }
       
       
  }
}