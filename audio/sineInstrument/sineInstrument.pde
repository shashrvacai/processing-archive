
import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
int count  = 0 ;
int seq =  0 ;

// to make an Instrument we must define a class
// that implements the Instrument interface.
class SineInstrument implements Instrument
{
  Oscil wave;
  Line  ampEnv;

  SineInstrument( float frequency )
  {
    // make a sine wave oscillator
    wave   = new Oscil( frequency, 0, Waves.SINE ); // we are going to patch a Line to it anyway, the amplitude is zero because
    ampEnv = new Line();
    ampEnv.patch( wave.amplitude );
  }

  // this is called by the sequencer when this instrument
  // should start making sound. the duration is expressed in seconds.
  void noteOn( float duration )
  {
    // start the amplitude envelope
    ampEnv.activate( duration, 0.5f, 0 );
    // attach the oscil to the output so it makes sound
    wave.patch( out );
  }

  // this is called by the sequencer when the instrument should
  // stop making sound
  void noteOff()
  {
    wave.unpatch( out );
  }
}

void setup()
{
  size(512, 200, P3D);

  minim = new Minim(this);

  // use the getLineOut method of the Minim object to get an AudioOutput object
  out = minim.getLineOut();

  // when providing an Instrument, we always specify start time and duration
  out.playNote( 0.0, 0.9, new SineInstrument( 597.99 ) );
  out.playNote( 1.0, 0.9, new SineInstrument( 123.47 ) );

  // we can use the Frequency class to create frequencies from pitch names
  out.playNote( 5.0, 2.9, new SineInstrument( Frequency.ofPitch( "A3" ).asHz() ) );
  out.playNote( 6.0, 1.9, new SineInstrument( Frequency.ofPitch( "B3" ).asHz() ) );
  out.playNote( 7.0, 0.9, new SineInstrument( Frequency.ofPitch( "D3" ).asHz() ) );
  out.playNote( 2.0, 2.9, new SineInstrument( Frequency.ofPitch( "C3" ).asHz() ) );
  out.playNote( 3.0, 1.9, new SineInstrument( Frequency.ofPitch( "E3" ).asHz() ) );
  out.playNote( 4.0, 0.9, new SineInstrument( Frequency.ofPitch( "G3" ).asHz() ) );
}

void draw()
{
  background(0);
  stroke(255);

  if(mouseX < 125 && mouseX> 0){
  out.playNote( 0.0, 0.2, new SineInstrument( Frequency.ofPitch( "A3" ).asHz() ) );
  
  }


  // draw the waveforms
  for (int i = 0; i < out.bufferSize() - 1; i++)
  {
    line( i, 50 + out.left.get(i)*5, i+1, 50 + out.left.get(i+1)*150 );
    line( i, 150 + out.right.get(i)*50, i+1, 150 + out.right.get(i+1)*50 );
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    setup();
  }
}
