import megamu.mesh.*;

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim       minim;
//AudioPlayer myAudio;
AudioInput  myAudio;
FFT         aFFT;

int         delFFT   = 11;
int         aM      = 200;  

float       amp     = 40.0;
float       aI       = 0.2;
float       aIa      = aI;
float       aIStep   = 0.35;

float[]     aData   = new float[delFFT];

ArrayList<Particule> myParticle;
int nbParticles;

//Voronoi & Delaunay
float[][] points;
Delaunay triangleDelaunay;

boolean clear, ea; 

void setup(){
size(500, 500);
 //fullScreen(JAVA2D);
  smooth();
  myParticle= new ArrayList<Particule>();
  
  
  minim   = new Minim(this);
  //myAudio = minim.loadFile("5_0bregue(Original Mix) 3.wav");
  //myAudio.loop();
  myAudio = minim.getLineIn(Minim.MONO);

  aFFT = new FFT(myAudio.bufferSize(), myAudio.sampleRate());
  aFFT.linAverages(delFFT);
  aFFT.window(FFT.GAUSS);
}

void draw()
{
  background(0);
  // fill(0,20);
  // rect(-10,-10,width+10,height+20);

    aFFT.forward(myAudio.mix);
    aDelData();
  //println(aData);
  if (mousePressed == true)
  {
    Particule p = new Particule(random(20, width-20), random(20, height-20)); 
    myParticle.add(p);
  }

  //1- Stocker les coordonnées de nos particules dans un tableau de point.
  points = new float[myParticle.size()][2];
  for (int i=0; i<myParticle.size(); i++)
  {
    Particule pi = myParticle.get(i);
    //text(i, pi.x+5, pi.y);
    points[i][0] = pi.x;
    points[i][1] = pi.y;
  }

  //Delaunay Diagram
  triangleDelaunay = new Delaunay( points );
  float[][] myEdges = triangleDelaunay.getEdges();
  if (ea == true)
  {
  for(int i=0; i<myEdges.length; i++)
    {
      float startX = myEdges[i][0];
      float startY = myEdges[i][1];
      float endX = myEdges[i][2];
      float endY = myEdges[i][3];
      strokeWeight(0.5);
      stroke(255);
      line( startX, startY, endX, endY );
    }
  }

  for (Particule p : myParticle)
  {
    p.motion();
    p.checkEdge();
    strokeWeight(1);
    p.display();
  }
}


void keyReleased()
{
  if (key == ' ') { myParticle.clear(); }
  if (key == 'x') { ea = !ea; }
  if (key == 's') { saveFrame("img_###.png"); }
}
      
void aDelData() {

  for (int i = 0; i < delFFT; ++i) {
    noStroke();
    fill(#0353F4);

    float partI = (aFFT.getAvg(i) * amp) * aIa;
    float tempIndexCon = constrain(partI, 0, aM);

    //rect(20 + (i*20), height, 20, -partI);
    aData[i] = tempIndexCon;
    aIa += aIStep;
  }
  aIa = aI;
}

void stop() {
  myAudio.close();
  minim.stop();  
  super.stop();
}
