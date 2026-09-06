import processing.serial.*;

Serial myPort;  // Create object from Serial class

void setup() 
{
  size(200,200); //make our canvas 200 x 200 pixels big
  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  int mX = int(map(mouseX , 0,width,0,64));
  int mY = int(map(mouseY , 0,height,0,64));
  myPort.write(mX+ ";" + mY + ";");
  
}
