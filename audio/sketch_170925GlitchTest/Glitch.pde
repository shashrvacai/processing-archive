class GlitchObject {
 
  GlitchObject () {
  }
 
  void run() {
    getSetGlitch1();
    getSetGlitch2();
    getSetGlitch3();
    getSetGlitch4();
    getSetGlitch5();
    getSetGlitch6();
    colorGlitch1();
    getSetGlitch7();
    elementGlitch1();
    elementGlitch2();
  }
 
  void getSetGlitch1() {
    for (int i=0; i<2; i++) {
      int x = r(width);
      int y = r(height);
      randomSeed(int(0.03*frameCount*i/10+r(36)));
      for (int j=0;j<r(10); j++) {
        set(x+r(width/50),y+int(pow(j,2)),get(x,y,r(width),r(height/10)));
      }
    }
  }
 
  void getSetGlitch2() {
    for (int i=0; i<10; i++) {
      int x = r(width);
      int y = r(height);
      randomSeed(int(0.05*frameCount+r(15)));
      for (int j=0;j<20; j++) {
        set(x+j*2+r(width)-width/2,y+j*10,get(x,y,r(width/10),r(5)));
      }
    }
  }
 
  void getSetGlitch3() {
    for (int i=0; i<10; i++) {
      int x = r(width);
      int y = r(height);
      set(x+r(50)-1,y+r(3)-1,get(x,y,r(99),r(30)));
    }
  }
 
  void getSetGlitch4() {
    for (int i=0; i<width; i++) {
      int x = r(width);
      int y = r(height);
      set(x+r(5)-2,y+r(5)-2,get(x,y,r(99),r(5)));
    }
  }
 
  void getSetGlitch5() {
    for (int i=0; i<width; i++) {
      int x = r(width);
      int y = r(height);
      randomSeed(int(0.02*frameCount+r(25)));
      set(x+r(20)-10,y+r(10)-5,get(x,y,r(55),r(3)));
    }
  }
 
  void getSetGlitch6() {
    for (int i=0; i<4; i++) {
      int x = r(width);
      int y = r(height);
      for (int j=0;j<r(5); j++) {
        set(x/10+r(width),y+j,get(x,y,r(width/15),r(height/5)));
      }
    }
  }
 
  void colorGlitch1() {
    float temp = noise(0.02*frameCount);
    if (temp > 0.6) { filter(INVERT); }
  }
 
  void getSetGlitch7() {
    for (int i=0; i<2; i++) {
      set(r(width),r(height),get(r(width),r(height),int(random(100,350)),int(random(100,350))));
    }
  }
 
  void elementGlitch1() {
    if (frameCount%(r(1000)+1) == 0) {
      stroke(random(360),100,100,100);
      strokeWeight(1);
      int lineDensity = int(noise(frameCount)*height/2);
      for (int i=0; i<height; i+=lineDensity) {
        line(0,i,width,i);
      }
    }
  }
 
  void elementGlitch2() {
    if (frameCount%(r(250)+1) == 0) {
      int lineDensity = int(noise(frameCount)*width);
      for (int i=0; i<width*1.5; i+=lineDensity) {
        stroke(0);
        strokeWeight(1);
        line(0,i,i,0);
      }
    }
  }
 
  int r(int a){
    return int(random(a));
  }
}