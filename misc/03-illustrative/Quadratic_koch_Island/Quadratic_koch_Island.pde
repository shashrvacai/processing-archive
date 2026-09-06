void setup() {
  size(500, 500);
  smooth();  
  background(255);
  stroke(0);
  strokeWeight(1);

  HashMap productions = new HashMap();
  productions.put('F', "F-F+F+FF-F-F+F");
  String axiom = "F-F-F-F";
  for (int i = 0;  i < 3; i++) {
    axiom = gen(axiom, productions);
  }
  
  HashMap commands = new HashMap();
  commands.put('F', F);
  commands.put('f', f);
  commands.put('-', minus);
  commands.put('+', plus);
  
  Turtle t = new Turtle(width * 0.25, height * 0.75, PI * 0.5);
  t.run(commands, axiom);
  Turtle t2 = new Turtle(width * 0.23, height * 0.73, PI * 0.5);
  t2.run(commands, axiom);
}

String gen(String input, HashMap productions) {
  StringBuffer buf = new StringBuffer();
  for (int i = 0; i < input.length(); i++) {
    char c = input.charAt(i);
    if (!productions.containsKey(c)) {
      buf.append(c);
      continue;
    }
    buf.append((String)productions.get(c));
  }
  return buf.toString();
}