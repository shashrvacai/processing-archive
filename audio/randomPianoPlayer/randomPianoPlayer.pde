import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
int count = 0 ;      // timer
int metro = 75 ;      //metronome  divided by the counter
float noteLen = 1.5 ;      // length of each note

// pitches starting C2 (C4 is middle C)
int[] pitches =  {  65,69,73,78,82,87,92,98,104,110,117,123,
                    131,139,147,156,165,175,185,196,207,220,233,247,
                    262,277,293,311,330,349,370,392,415,440,466,494,
                    523,554,587,622,659,698,740,784,831,880,923,988,
                    1047,1109,1175,1245,1382,1397,1480,1568,1661,1760,1865,1976};   

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
 
  MyNote newNote;   // new note 
  float pitch = 0 ;      // initialize pitch and reset it to 0 ; 
 
  if(count%metro == 0){                                // playnote on metro
    pitch = pitches[(int)random(0,pitches.length)];    // chooses a random note
  }
  
  if (pitch > 0) {
      newNote = new MyNote(pitch, noteLen);
   }
  
  for(int i = 0; i < out.bufferSize() - 1; i++)   // draw lines 
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
