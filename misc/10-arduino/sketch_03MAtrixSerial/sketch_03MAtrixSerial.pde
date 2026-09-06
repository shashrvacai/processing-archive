import processing.serial.*;

Serial myPort;  // Create object from Serial class

int matX = 5 , matY = 4;

void setup() 
{
  size(200,200); //make our canvas 200 x 200 pixels big
  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  int mX = floor(map(mouseX , 0,width,0,matX));
  int mY = floor(map(mouseY , 0,height,0,matY));
  println(mX , mY);
  
  myPort.write(mX+ ";" + mY + ";");
  
  
  for(int i = 0 ; i < width ; i += width/matX){
    for(int j = 0 ; j < height ; j += height/matY){
      rect(i,j,width/matX,height/matY);
  }  
  }
  
}
