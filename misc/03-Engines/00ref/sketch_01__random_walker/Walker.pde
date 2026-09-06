class Walker {
  int x, y ;
  int  s = 25 ;  //  size , distance 
  Walker() {
    x = width/2;
    y = height/2;
  }
    
   void render(){
     //stroke(0);
     ellipse(x,y,s*2,s*2);
     //point(x,y);
   }
   
   void step(){
     int c = int(random(4));
     
     if(c == 0){
       fill(0);
       x += s ;
     }else if (c == 1){
       fill(255);
       x -= s  ;
     }else if (c ==2){
       fill(85);
       y +=s ;
     }else if (c ==3 ){
       fill(170);
       y -= s ;
     }
     
     x = constrain(x, 0, width-s);
     y=  constrain(y , 0, height- s);
     
   }
    
}