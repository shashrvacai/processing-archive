class Walker {
  int x,y,S,R,r;
  

   Walker(){
     x = width/2;
     y = height/2;
     S = 16; // speed  - distance between the centers of the circle
     R= 140;  // size of the constraint
     r=8; // raduis of the spheres
   }
   
   void render() {
      noStroke();  //stroke color
     fill(124,204,241,25);   // fill color
     ellipse(x,y,r,r);
     
   }
   
   void step(){
     int choice = int(random(4));
     
       if(choice ==0) {
         x+=S;
         y+=S;
       } else if (choice ==1 ){
         x-=S;
         y+=S;
       } else if (choice ==2 ){
         y-=S;
         x-=S;
       } else if (choice ==3 ){
         y-=S;
         x+=S;
       }
       
      x =constrain(x,width/2-R,width/2+R);
      y =constrain(y,height/2-R,height/2+R);
     
   }
}