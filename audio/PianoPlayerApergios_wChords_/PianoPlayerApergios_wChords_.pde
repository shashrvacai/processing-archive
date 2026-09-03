import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;

float xoff = 0.0;
int count = 0 ;      // timer
int metro = 15 ;      //metronome  divided by the counter for scales
int metro2 = 20 ;    // metronome for the chords
float noteLen = 0.5 ;      // length of each note
float choLen = 1.5 ;       // length of the chord
int ranPick ;    // to pick random(perlin) note to play
int ranChord[] ={0,0,0,0} ;       // to pick a radom start key for a chord 


// pitches starting C2 (C4 is middle C)
int[] pitches =  {  65, 69, 73, 78, 82, 87, 92, 98, 104, 110, 117, 123, 
  131, 139, 147, 156, 165, 175, 185, 196, 207, 220, 233, 247, 
  262, 277, 293, 311, 330, 349, 370, 392, 415, 440, 466, 494, 
  523, 554, 587, 622, 659, 698, 740, 784, 831, 880, 923, 988, 
  1047, 1109, 1175, 1245, 1382, 1397, 1480, 1568, 1661, 1760, 1865, 1976};   
// in the Array, C is 0 , 12 , 24 etc 

//Q
int C[] = {0, 4, 7, 11,    12, 16, 19, 23,    24, 28, 31, 35,   36, 40, 43, 47,   48, 52, 55, 59};   // C.E.G.B.
//W
int Csharp[] = { 1, 5, 8, 12,   13, 17, 20, 24,   25, 29, 32, 36,   37, 41, 44, 48,   49, 53, 56, 60};  // C#.F.G#.C.
//E
int D[] = { 1, 2, 6, 9,   13, 14, 18, 21,    25, 26, 30, 33,   37, 38, 42, 45,   50, 51, 54, 57};  // D.F#.A.C#.
//R
int EFlat[] = {2, 3, 7, 10,   14, 15, 19, 22,     26, 27, 31, 34,   38, 39, 43, 46,   50, 51, 55, 58};  // Eb.G.Bb.D 
//T
int E[] = { 3, 4, 8, 11,   15, 16, 20, 23,   27, 28, 32, 35,   39, 40, 44, 47,   51, 52, 56, 59};  // E.G#.B.D#
//Y
int F[] = {0, 4, 5, 9,   12, 16, 17, 21,   24, 28, 29, 33,   36, 40, 41, 45,   48, 52, 53, 57};  // F.A.C.E.
//U
int Fsharp[] = {1, 5, 6, 10,   13, 17, 18, 22,   25, 29, 30, 34,   37, 41, 42, 46,   49, 53, 54, 58};  // F#.A#.C#.F
//I
int G[] = {3, 6, 7, 11,   15, 18, 19, 23,   27, 30, 31, 35,   39, 42, 43, 47,   51, 54, 55, 59};  // G.B.D.F#
//O
int Aflat[] = {0, 3, 7, 8,   12, 15, 19, 20,   24, 27, 31, 32,   36, 39, 43, 44,   48, 51, 55, 56};  // Ab.C.Eb.G.
//P
int A[] = {1, 4, 8, 9,   13, 16, 20, 21,   25, 28, 32, 33,   37, 40, 44, 45,   49, 52, 56, 57};  //A.C#.E.G#
//[
int Bflat[] = {2, 5, 9, 10,   14, 17, 21, 22,   26, 29, 33, 34,   38, 41, 45, 46,   50, 53, 57, 58 };  // Bb.D.F.A.
//]
int B[] = {3, 6, 10, 11,   15, 18, 22, 23,   27, 30, 34, 35,   39, 42, 46, 47,    51, 54, 58, 59};  // B.D#.F#.A#

int nowPlaying[]= C ;
int playingChord[] = E ;

void setup()
{
  size(512, 200, P3D); 
  minim = new Minim(this);   // initialize minim
  out = minim.getLineOut(Minim.STEREO);
}

void draw()
{
  background(0);
  stroke(255);  

  MyNote newNote , ch1,ch2,ch3,ch4 ;   // new note 
  float pitch = 0 ;      // initialize pitch and reset it to 0 ; 
  float cho1 = 0 , cho2 = 0, cho3 = 0 , cho4 = 0; 

 if(count%metro2== 0){
   int n = (int)map(noise(xoff),0,1,0,playingChord.length-4);   // length -4 to avaid picking random note from the end
    arrayCopy(playingChord,n,ranChord,0,4);     // picks a random chord
    //println(ranChord);
    cho1 = ranChord[0];    cho2 = ranChord[1];
    cho3 = ranChord[2];    cho4 = ranChord[3];    
 }

  xoff = xoff + .01; 
  
  float m = (int)map(noise(xoff),0,1,0,50);        // maps the speed of the metronome 
  if (count%m == 0) {           // playnote on metro
    int n = (int)(noise(xoff) * nowPlaying.length);

    ranPick = nowPlaying[n];
    pitch = pitches[ranPick];    // chooses a random note
  }

  
  if (pitch > 0) {
    newNote = new MyNote(pitch, noteLen);
    ch1 = new MyNote(cho1,choLen);
    ch2 = new MyNote(cho2,choLen);
    ch3 = new MyNote(cho3,choLen);
    ch4 = new MyNote(cho4,choLen);
  }

  for (int i = 0; i < out.bufferSize() - 1; i++)   // draw lines 
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line( x1, 50 + out.left.get(i)*5, x2, 50 + out.left.get(i+1)*150 );
    line( x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*250 );
  }

  count ++ ;
}

void stop()
{
  out.close();
  minim.stop(); 
  super.stop();
}


void keyPressed()
{

  switch(key) {
  case 'q':     nowPlaying = C;
    ; 
    break;    
  case 'w': 
    nowPlaying = Csharp; 
    break;    
  case 'e': 
    nowPlaying = D; 
    break;    
  case 'r': 
    nowPlaying = EFlat; 
    break;    
  case 't': 
    nowPlaying = E; 
    break;    
  case 'y': 
    nowPlaying = F; 
    break;    
  case 'u': 
    nowPlaying = Fsharp; 
    break;    
  case 'i': 
    nowPlaying = G; 
    break;    
  case 'o': 
    nowPlaying = Aflat; 
    break;    
  case 'p': 
    nowPlaying = A; 
    break;     
  case '[': 
    nowPlaying = Bflat; 
    break;    
  case ']': 
    nowPlaying = B; 
    break;
  }
}
