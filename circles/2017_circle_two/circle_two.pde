int x; 
int y; 
int r = 200; 
int px = r; 
int s; 
int cx = 200; 
int cy = 200; 
float a = 0 ;

void setup() {

  size(500, 500);
}

void draw() {
  background(0);
  stroke(255);
  float dd = map(sin(a),-1,1,0,1);
  for (int i=0; i<=r; i++) { 
    y=i; 
    s=(int) sqrt(r*r-i*i); 
    for (x=s; x<=px; x++) { 
      set(cx+x, cy+(floor(y*dd*2)), 255); 
      set(cx-(floor(x*dd*2)), cy-y, 255); 
      set(cx+x, cy-y, 255); 
      set(cx-x, cy+y, 255);
    } 
    px=s;
  }
  a+= 0.1 ;
}