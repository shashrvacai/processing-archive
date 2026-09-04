class star {
  float x, y, speed, d, age, sizeIncr;
  int wachsen;
  star() {
    x = random(width);    y = random(height);     speed =cc10;
    wachsen= int(random(0, 1));
    if (wachsen==1)d = 0;
    else {  d= random(0.2, 5); }
    age=0;
    sizeIncr= random(0, 10);
  }
  void render() {
    age++;
    if (age<500) {
      if (wachsen==1) {
        d+=sizeIncr;
        if (d>3||d<-3) d=3;
      } else {
        if (d>3||d<-3) d=3;
        d= d+0.2-0.6*noise(x, y, frameCount);
      }
    } else {
      if (d>3||d<-3) d=3;
    }
     
    ellipse(x, y, d*(map(noise(x, y, 0.001*frameCount), 0, 1, 0.2, 5)), d*(map(noise(x, y, 0.001*frameCount), 0, 1, 0.2, 5)));
  }
  void move() {
    x =x-map(cc8, 0,127, -0.1*speed, 0.1*speed)*(width/2-x);  //  ------------     the center of the star sketch     
    y =y-map(cc9, 0,127,  -0.1*speed, 0.1*speed)*(height/2-y);
  }
}  
