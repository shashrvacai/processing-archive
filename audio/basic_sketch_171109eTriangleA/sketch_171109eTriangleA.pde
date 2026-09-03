float t=0.001;
void setup()
{
  size(540, 540);
  strokeWeight(3);
}
void draw()
{
  background(240);
  harom(500,460,40,460,6,(sin(0.0005*millis()%(2*PI))+1)/2);
}

void harom(float ax, float ay,float bx, float by, int level,float ratio)
{
  if(level!=0){
  float vx,vy,nx,ny,cx,cy;
  vx=bx-ax;
  vy=by-ay;
  nx=cos(PI/3)*vx-sin(PI/3)*vy; 
  ny=sin(PI/3)*vx+cos(PI/3)*vy; 
  cx=ax+nx;
  cy=ay+ny;
  line(ax,ay,bx,by);
  line(ax,ay,cx,cy);
  line(cx,cy,bx,by);
  harom(ax*ratio+cx*(1-ratio),ay*ratio+cy*(1-ratio),ax*(1-ratio)+bx*ratio,ay*(1-ratio)+by*ratio,level-1,ratio);
  }
}