int f ;
int ele =100;
float [] sz = new float[ele];
float [] rot = new float[ele];
float t, off, sc, x, y ;

void setup() {
  size(1000, 1000);
  background(20);
  float Sz = 0;

  for (int i = 0; i < ele; i++) {
    if (i < ele/2) {
      Sz = ele/4 + 2*i;
    } else {
      Sz = ele/2 + 2*(ele*i);
    }
    sz[i]= Sz;
    rot[i]= PI/ele*i;
  }
}

void draw() {
  //background(0);
  fill(0,50);
    rect(0,0,height,width);
  noFill();
  translate(width/2, height/2);

  for (int i = 0; i< ele; i++) {
    pushMatrix();
    off = map(sin(rot[i]+t*2), -1, 1, -90, 120);
    sc= map(cos(rot[i]+t),-1,1,.5,1);
    x = map(sin(rot[i]+t), -1, 1, -20, 100);
    y = map(sin(rot[i]+t*2), -1, 1, -40, 120);     
    rotate(radians(off));
    stroke(10,150,250);
    noFill();
    
    ellipse(x,y,sz[i]*sc,sz[i]*sc);
    
    
    stroke(200,250,050);
    x = map(sin(rot[i]+t*2), -1, 1, -120, 260);
    y = map(sin(rot[i]+t/2), -1, 1, -240, 120);  
  //fill(100,125,25);
    ellipse(x,y+200,sz[i]*sc,sz[i]*sc);
    popMatrix();
  }
  t += 0.05;
}