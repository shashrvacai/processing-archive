int[] dx,dy;
int mx=160;
int my=120;
int radius1=100;
int radius2=50;
int boxsize=10;

void setup()
{
  size(640,480,P2D);
  dx=new int[width];
  dy=new int[height];
  
  for(int y=0;y<height;y++)
  {
    dy[y]=int(sq(y)*256);
  }
  for(int x=0;x<width;x++)
  {
    dx[x]=int(sq(x)*256);
  }
  
}

void draw()
{
  background(0);
  //println(frameRate);
  mx=mouseX-width/2;
  my=mouseY-height/2;
  for(int y=0;y<height-boxsize+1;y+=boxsize)
  {
    for(int x=0;x<width-boxsize+1;x+=boxsize)
    {
      int sum=0;
      sum+=(radius1<<23)/(dx[abs(width/2-x+(boxsize/2))]+dy[abs(height/2-(y+boxsize/2))]+1);
      sum+=(radius2<<23)/(dx[abs(width/2-x+(boxsize/2)+mx)%width]+dy[abs(height/2-y+(boxsize/2)+my)%height]+1);
      if(sum>150)
      {
        for(int yy=y;yy<(y+boxsize);yy++)
        {        
          for(int xx=x;xx<(x+boxsize);xx++)
          {
            sum=0;
            sum+=(radius1<<23)/(dx[abs(width/2-xx)]+dy[abs(height/2-yy)]+1);
            sum+=(radius2<<23)/(dx[abs(width/2-xx+mx)%width]+dy[abs(height/2-yy+my)%height]+1);      
            if(sum>(150+boxsize<<2))
            set(xx,yy,color(255,0,0));
          }
        }        
      }            
    }
  }
}
 