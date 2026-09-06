LANE l[];

float A, r ,h ;



void setup() {
  translate(width/2,height/2);
  size(600, 600);
  A = 0 ;
  r = 100 ;
  h = 10 ;
  for(int i = 0 ; i < width ;  i += 10 ){
    l= new LANE(i);
   }
    
  
  stroke(255);
  
 
}

void draw(){
  translate(width/2,height/2);
  background(0);
   
  //for(int i = 0 ; i < width ;  i += 10 ){
   l.update();
  //}
   
}