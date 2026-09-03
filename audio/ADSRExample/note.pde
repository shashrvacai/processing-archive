class ToneInstrument implements Instrument
{
  Oscil sineOsc;
  ADSR  adsr;
  
  // constructor for this instrument
  ToneInstrument( float frequency, float amplitude , float sustain )
  {    
    // create new instances of any UGen objects as necessary
    sineOsc = new Oscil( frequency, amplitude, Waves.SINE );
    
    //ADSR constructor   ADSR(float maxAmp, float attTime, float decTime, float susLvl, float relTime)
    //Constructor for an ADSR envelope with maximum amplitude, attack Time, decay time, sustain level, and release time.
    adsr = new ADSR( 0.5, 0.01, 0.05, sustain, 0.5 );
    
    // patch everything together up to the final output
    sineOsc.patch( adsr );
  }
  
  // every instrument must have a noteOn( float ) method
  void noteOn( float dur )
  {
    // turn on the ADSR
    adsr.noteOn();
    // patch to the output
    adsr.patch( out );
   }
  
  // every instrument must have a noteOff() method
  void noteOff()
  {
    // tell the ADSR to unpatch after the release is finished
    adsr.unpatchAfterRelease( out );
    // call the noteOff 
    adsr.noteOff();
  }
}
