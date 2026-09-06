import processing.serial.*;

Serial port;  // Create object from Serial class


void setup() 
{
  size(600, 600); //make our canvas 200 x 200 pixels big
  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  port = new Serial(this, portName, 115200);
}

void draw() {
  int mX = int(map(mouseX, 0, width, 0, 64));
  int mY = int(map(mouseX, 0, width, 0, 64));

  
  port.write(mX);
  port.write(",");
  port.write(mY);
 
}
