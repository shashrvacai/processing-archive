class Spring {
  PVector A ;
  float l;
  float k = 0.2 ;
  
   Spring(float x_ , float y_ , int l_){
     A = new PVector(x_,y_);
     l= l_ ;
   }
   
   void connect (Mover b) {
     PVector f = PVector.sub(b.pos,A);    // cl - rl
     float d = f.mag();     // dist between the two .   
     float S =  d - l ;
     
     f.normalize();
     f.mult(-1 * k * S);
     b.applyForce(f);
 
 }
}