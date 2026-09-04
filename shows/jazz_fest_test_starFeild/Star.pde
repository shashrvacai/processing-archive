class star {
  float x, y, speed, d, age,sizeIncr;
  int wachsen;
  star() {
    x = random(width);
    y = random(height);
    speed = random(0.2, 5);
    wachsen= int(random(0, 2));
    if(wachsen==1)d = 0;
    else {
      d= random(0.2, 3);
    }
    age=0;
    sizeIncr= random(0,0.03);
  }
  void render() {
   age++;
     if (age<200){
       if (wachsen==1){
         d+=sizeIncr;
         if (d>3||d<-3) d=3;
       }else {
         if (d>3||d<-3) d=3;
         d= d+0.2-0.6*noise(x, y, frameCount);
       }
       
 
     }
     else{
       if (d>3||d<-3) d=3;
     }
    
    ellipse(x, y, d*(map(noise(x, y,0.001*frameCount),0,1,0.2,3)), d*(map(noise(x, y,0.001*frameCount),0,1,0.2,3)));
  }
  void move(float aa_) {
    x =x-map(pos.x, 0, width, -aa_*speed, aa_*speed)*(w2-x); 
    y =y-map(pos.y, 0, height, -aa_*speed, aa_*speed)*(h2-y);
  }
}
