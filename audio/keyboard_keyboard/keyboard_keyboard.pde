import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.signals.*;
 
Minim minim;
AudioOutput out;

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
    case 'z': pitch = 262; break;    // middle C  c4
    case 's': pitch = 277; break;    // c4#
    case 'x': pitch = 294; break;    // d4
    case 'd': pitch = 311; break;    // d4#
    case 'c': pitch = 330; break;    // e4
    case 'v': pitch = 349; break;    // f4
    case 'g': pitch = 370; break;    // f4#
    case 'b': pitch = 392; break;    // g4
    case 'h': pitch = 415; break;    // g4#
    case 'n': pitch = 440; break;    // a4 
    case 'j': pitch = 466; break;    // a4#
    case 'm': pitch = 494; break;    // b4
    case ',': pitch = 523; break;    // c5
    case 'l': pitch = 554; break;    //c5#
    case '.': pitch = 587; break;    //d5
    case ';': pitch = 622; break;    //d5#
    case '/': pitch = 659; break;    // e5
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
