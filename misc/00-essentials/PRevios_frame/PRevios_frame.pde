PVector v;
PVector screenPos;
PVector previous, current;
void setup()
{
  size(550, 550);
  screenPos = new PVector(mouseX, mouseY);
  v= new PVector();
  v.x= screenPos.x;
}

void draw()
{
  screenPos = new PVector(mouseX, mouseY);

  if (frameCount%2==0) 
  {

    previous =v;
    v= screenPos;
    current =v;
    println("======================PREVIOUS FRAME======================");
    println("previous:  "+previous);
    println("======================CURRENT FRAME======================");
    println("current:  "+current);
    println("DISTANCE:  "+current.sub(previous));
  }
}
