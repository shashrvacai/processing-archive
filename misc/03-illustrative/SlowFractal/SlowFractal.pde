ArrayList<Branch> tree = new ArrayList<Branch>();
ArrayList<PVector> leaves = new ArrayList<PVector>();

int fC  =  0 ; 
int count = 0;

void setup() {
  size(400, 400);
  //create root-Branch
  PVector a = new PVector(width / 2, height);
  PVector b = new PVector(width / 2, height - 100);
  Branch root = new Branch(a, b); 




  tree.add(root);
}




void draw() {
  background(51);

  //forEach Branch of the Tree: Draw it
  for (int i = 0; i < tree.size(); i++) {
    tree.get(i).show();
  }

  if(count < 4 ){
  if (fC == 20 ) {
    for (int i = tree.size() -1; i >= 0; i--) {
      Branch current = tree.get(i);
      //if the current Branch has no children: add them
      if (!current.finished) {
        tree.add(current.branchA());
        tree.add(current.branchB());
      }
      //now that Branch has children
      current.finished = true;
    }
    count ++;

    //on the 6. Level: spawn the Leaves
    if (count == 6) {
      for (int i = 0; i < tree.size(); i++) {
        Branch current = tree.get(i);
        //if the current Branch is on the last Level
      }
    }
    fC = 0 ;
  }
  }


  //forEach Leave: draw it
  for (int i = 0; i < leaves.size(); i++) {
    fill(255, 0, 100, 100);
    noStroke();
    PVector leave = leaves.get(i);
    ellipse(leave.x, leave.y, 8, 8);
    //let the Leave fall
    leave.y += random(0, 2);
  }
  fC += 1 ;
}
