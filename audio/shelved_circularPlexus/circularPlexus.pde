float x= 0 , x1 =1 , y = 0 , y1 = 1 , a =0 , b = 0 , r = 100 , r1 = 40;
float sz = 20 , X = 0 ,Y =0;


 void setup(){
   //size(600,600);
   fullScreen(1);
   surface.setResizable(true);
    background(10);
    r = width/4 ;
    r1 = height/4;
 }
 
 void draw(){
   noStroke();
   fill(0,50);
   rect(0,0,width,height);
   noFill();
  
   X = sin(a)*width/4 ; 
   Y = sin(b)*height/4 ; 
   translate(width/2,height/2);
   
   x = sin(a)*r ;
   y = X+cos(a)*r ;
   x1 = Y+sin(b)*r1 ;
   y1 = cos(b)*r1 ;
   
   float d = map((dist(x,x1,y,y1)),-r/2,r/2,0.1,1);
   
   stroke(255);
   strokeWeight(d);
   //line(x,y,x1,y1);
   
    polygon(x, y,width/4, 3, x1, y1, 100, 3);
   //ellipse(x,y,sz,sz);
   //ellipse(x1,y1,sz,sz);
   a += 0.001 ;
   b -= 0.005 ;
 }