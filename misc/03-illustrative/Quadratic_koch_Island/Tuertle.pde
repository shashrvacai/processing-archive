float D = 4.0;

class Turtle {
  PVector position;
  float heading;
  HashMap commands;
  
  Turtle(float x, float y, float heading) {
    this.position = new PVector(x, y);
    this.heading = heading;
  }
  
  void run(HashMap commands, String program) {
    for (int i = 0; i < program.length(); i++) {
      char c = program.charAt(i);
      if (!commands.containsKey(c)) continue;
      TurtleCommand cmd = (TurtleCommand)commands.get(c);
      cmd.run(this);
    }
  }
}

abstract class TurtleCommand {
  public abstract void run(Turtle t);
}

TurtleCommand F = new TurtleCommand() {
  public void run(Turtle t) {
    float x = t.position.x + D * cos(t.heading);
    float y = t.position.y - D * sin(t.heading);
    line(t.position.x, t.position.y, x, y);
    t.position.x = x;
    t.position.y = y; 
  }
};

TurtleCommand f = new TurtleCommand() {
  public void run(Turtle t) {
    t.position.x += D * cos(t.heading);
    t.position.y -= D * sin(t.heading);
  }
};

TurtleCommand plus = new TurtleCommand() {
  public void run(Turtle t) {
    t.heading += PI * 0.5;
    
  }
};

TurtleCommand minus = new TurtleCommand() {
  public void run(Turtle t) {
    t.heading -= PI * 0.5;
    
  }
};