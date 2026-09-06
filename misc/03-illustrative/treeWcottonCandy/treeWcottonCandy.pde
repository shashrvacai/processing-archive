ArrayList<Branch> tree = new ArrayList<Branch>();
ArrayList<PVector> leaves = new ArrayList<PVector>();
int count = 0;

/**
* sets the Tree up
*/
void setup(){
  size(600,600);
  surface.setResizable(true);
  //create root-Branch
  PVector a = new PVector(width / 2, height);
  PVector b = new PVector(width / 2, height- height/4);
  Branch root = new Branch(a, b); 
  tree.add(root);
}

/**
* adds another Layer every time the Mouse is pressed
*/
void mousePressed(){
  for(int i = tree.size() -1; i >= 0; i--){
    Branch current = tree.get(i);
    //if the current Branch has no children: add them
    if(!current.finished){
      tree.add(current.branchA());
      tree.add(current.branchB());
    }
    //now that Branch has children
    current.finished = true;
  }
  //new Level added
  count ++;
  
  //on the 6. Level: spawn the Leaves
  if(count == 6){
    for(int i = 0; i < tree.size(); i++){
      Branch current = tree.get(i);
      //if the current Branch is on the last Level
      if(!current.finished){
        PVector leaf = current.end.copy();
        leaves.add(leaf);
      }
    }
  }
    
}

/**
* Displays the Tree
*/
void draw(){
  background(0);
  
  //forEach Branch of the Tree: Draw it
  for(int i = 0; i < tree.size(); i++){
    tree.get(i).show();
  }
  
  //forEach Leave: draw it
  for(int i = 0; i < leaves.size(); i++){
    stroke(255, 0, 100, 100);
    noFill();
    PVector leave = leaves.get(i);
    rect(leave.x, leave.y, 8, 8);
    //let the Leave fall
    leave.y += random(0, 2);
  }
}