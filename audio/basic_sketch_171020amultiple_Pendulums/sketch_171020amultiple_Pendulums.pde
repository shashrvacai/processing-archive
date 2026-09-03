Bob[] bs = new Bob[55];


float Br = 20 ;
color t = color(15,148,240);
color b = color(167,840,60);

void setup(){
  size(1000,1000);
  background(0);

  for (int i =0 ; i < bs.length; i++){
    bs[i] = new Bob(new PVector(width/2,0),45+(i*Br), Br);
  }
  
}

void draw(){
  fill(0,20);
  rect(0,0,width,height);
  noFill();


  for (int i =0 ; i < bs.length; i++){
    
    float c = map(i , 0, bs.length, 0,1);
    color C = lerpColor(t,b,c);
    fill(C);
    bs[i].update();
    bs[i].show();
  }
  
  
}