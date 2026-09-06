class Walker {
  int x, y ;
  int s = 25 ; // universal Size 
  
  Walker(){
     x = width/2;
     y = height/2;
  }
  void step(){
    float c = random(1);
    
    if (c < 0.2){
      fill(0);
      x +=s ;
    }else if(c <0.5){
      fill(50);
      x-=s ; 
    }else if(c <0.7){
      fill(100);
      y-= s ; 
    }else {
      fill(200);
      y+= s ; 
    }
    
    x = constrain(x , s , width-s);
    y = constrain(y , s , height-s);
  }
  
  void render(){
    ellipse(x,y,s*2,s*2); // draw ellipse 
  }
 }