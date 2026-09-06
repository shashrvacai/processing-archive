
class Par {
   PVector pos, acc, vel ;
   float ls ;
   float r =6 ; 
   boolean HL ;
   
   Par(PVector o_){
     acc = new PVector(0,0.05);
     vel = new PVector (random(-1,1),random(-1,1));
     pos = o_.get();
     ls = 255 ;
   }
   
   void run(){
     update();
     show();
   }
   
   void intersect(ArrayList<Par> ps){
     HL = false ;
     for(Par other : ps){
       if(other != this){
         float d = PVector.dist(other.pos,pos);
         if(d < r + other.r){
           HL = true ; 
         }
       }
     }
   }
   
   void af(PVector f_){
     acc.add(f_);
   }
   
   void update(){
     vel.add(acc);
     pos.add(vel);
     acc.mult(0);
     ls -= 2 ;
   }
   
   void show(){
     noStroke();
     fill(155,ls);
        
     if(HL){
       fill(155,30,45,ls);
     }
     ellipse(pos.x, pos.y, r*2,2*r);
   }
   
   boolean isDead(){
     if(ls< 0){
       return true ;
     }else {
       return false ;
     }
   
   }
}  