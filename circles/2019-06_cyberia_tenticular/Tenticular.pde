color BG_COLOR =color(130,10);

PVector originePoint = new PVector(0, 0);
ArrayList<Tentacle> tabTentacles;
int[] tentaclesToRemove;//tentacles that die
ArrayList<Tentacle> tentaclesToAdd;//tentacles that were born
Boolean doAdd = false;

void setup()
{
  size(650, 650, P2D);
  
  smooth();
  tabTentacles = new ArrayList<Tentacle>();
}

void draw(){
  background(10,10);
  tentaclesToRemove = new int[0];
  tentaclesToAdd = new ArrayList<Tentacle>();
  if (doAdd)  {    addTentacle();  }

  int s1 = tabTentacles.size();
  for (int i = 0; i < s1; i ++)
  {    tabTentacles.get(i).update(i);  }

  int s2 = tentaclesToRemove.length;
  for (int i = s2-1; i > -1; i --)  {    tabTentacles.remove(tentaclesToRemove[i]);  }

  int s3 = tentaclesToAdd.size();
  for (int i = 0; i < s3; i ++)
  {    tabTentacles.add(tentaclesToAdd.get(i));  }
}

void addTentacle()
{  originePoint = new PVector(mouseX, mouseY);
  tabTentacles.add(new Tentacle(originePoint, 0, 0)); }


void mousePressed(){  doAdd = true;}

void mouseReleased(){  doAdd = false;}
