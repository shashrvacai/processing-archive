import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;

float[] pitches =  {262,277,293,311,330,349,370,392,415,440,466,
                    494,523,554,587,622,659,698,740,784,831};   // pitches starting middle C

void setup()
{
  size(512, 200, P3D);
 
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  
  
}
 
void draw()
{
  background(0);
  stroke(255);
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line( x1, 50 + out.left.get(i)*5, x2, 50 + out.left.get(i+1)*150 );
    line( x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*250 );
  }
}
 
void keyPressed()
{
  MyNote newNote;

  float pitch = 0;
  switch(key) {
    case 'z': pitch = pitches[0]; break;    // middle C  c4
    case 's': pitch = pitches[1]; break;    // c4#
    case 'x': pitch = pitches[2]; break;    // d4
    case 'd': pitch = pitches[3]; break;    // d4#
    case 'c': pitch = pitches[4]; break;    // e4
    case 'v': pitch = pitches[5]; break;    // f4
    case 'g': pitch = pitches[6]; break;    // f4#
    case 'b': pitch = pitches[7]; break;    // g4
    case 'h': pitch = pitches[8]; break;    // g4#
    case 'n': pitch = pitches[9]; break;    // a4 
    case 'j': pitch = pitches[10]; break;    // a4#
    case 'm': pitch = pitches[11]; break;    // b4
    case ',': pitch = pitches[12]; break;    // c5
    case 'l': pitch = pitches[13]; break;    //c5#
    case '.': pitch = pitches[14]; break;    //d5
    case ';': pitch = pitches[15]; break;    //d5#
    case '/': pitch = pitches[16]; break;    // e5
  }
  
   if (pitch > 0) {
      newNote = new MyNote(pitch, 0.2);
   }
}

void stop()
{
  out.close();
  minim.stop();
 
  super.stop();
}

class MyNote implements AudioSignal
{
     private float freq;
     private float level;
     private float alph;
     private SineWave sine;
     
     MyNote(float pitch, float amplitude)
     {
         freq = pitch;
         level = amplitude;
         sine = new SineWave(freq, level, out.sampleRate());
         alph = 0.9;
         out.addSignal(this);
     }

     void updateLevel()
     {
         level = level * alph;
         sine.setAmp(level);
         
         if (level < 0.01) {
             out.removeSignal(this);
         }
     }
     
     void generate(float [] samp)
     {
         sine.generate(samp);
         updateLevel();
     }
     
    void generate(float [] sampL, float [] sampR)
    {
        sine.generate(sampL, sampR);
        updateLevel();
    }

}
